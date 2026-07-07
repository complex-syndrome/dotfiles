{ config, ... }:
let
  inherit (config.flake.modules) nixos homeManager;
in
{
  flake.modules.nixos.niri = {
    imports = [ nixos.compositorCommon ];

    home-manager.sharedModules = [
      homeManager.compositorCommon
      homeManager.niri
    ];

    services.displayManager.defaultSession = "niri";
    programs.niri.enable = true;
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
