{ config, ... }:
{
  flake.modules.nixos.localsend = {
    home-manager.sharedModules = [ config.flake.modules.homeManager.localsend ];
    networking.firewall = {
      enable = true;
      allowedTCPPorts = [ 53317 ];
      allowedUDPPortRanges = [
        {
          from = 4000;
          to = 4007;
        }
        {
          from = 53315;
          to = 53318;
        }
        {
          from = 8000;
          to = 8010;
        }
      ];
    };
  };

  flake.modules.homeManager.localsend =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.localsend ];
    };
}
