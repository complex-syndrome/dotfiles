{ pkgs, ... }:

{
  flake.modules.nixos.brave =
    { pkgs, ... }:
    {
      imports = [
        ./_chromium-extensions.nix
      ];

      environment.systemPackages = with pkgs; [
        brave
      ];
    };
}
