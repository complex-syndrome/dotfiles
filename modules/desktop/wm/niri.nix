{ config, inputs, ... }:
let
  inherit (config.flake.modules) nixos homeManager;
in
{
  flake.modules.nixos.niri = {
    imports = [
      nixos.compositorCommon
      inputs.noctalia-greeter.nixosModules.default
    ];

    home-manager.sharedModules = [
      homeManager.compositorCommon
      homeManager.niri
    ];

    programs.niri.enable = true;

    programs.noctalia-greeter = {
      enable = true;
      settings = {

      };
    };
  };

  flake.modules.homeManager.niri =
    { pkgs, config, ... }:
    {
      xdg.configFile = {
        "niri" = {
          source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/niri";
        };
      };

      home.packages = with pkgs; [
        xwayland-satellite
        brightnessctl
      ];
    };
}
