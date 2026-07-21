# %s/showtime/CHANGETHIS/g
{
  flake.modules.homeManager.showtime =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.showtime ];
    };
}
