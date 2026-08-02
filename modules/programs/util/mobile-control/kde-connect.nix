{ config, ... }:
{
  flake.modules.nixos.kde-connect =
    let
      hm = config.flake.modules.homeManager;
    in
    {
      home-manager.sharedModules = [ hm.kde-connect ];
      networking.firewall = {
        allowedTCPPortRanges = [
          {
            from = 1714;
            to = 1764;
          }
        ];

        allowedUDPPortRanges = [
          {
            from = 1714;
            to = 1764;
          }
        ];
      };
    };

  flake.modules.homeManager.kde-connect =
    { pkgs, ... }:
    {
      services.kdeconnect = {
        enable = true;
        indicator = true;
      };

      home.packages = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
      ];

    };
}
