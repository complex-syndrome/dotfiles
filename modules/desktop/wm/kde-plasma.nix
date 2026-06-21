{ config, ... }:
let
  inherit (config.flake.modules) nixos homeManager;
in
{
  flake.modules.nixos.kde-plasma =
    { config, ... }:
    {
      services.displayManager.sddm.enable = true;
      services.desktopManager.plasma6.enable = true;
    };
}
