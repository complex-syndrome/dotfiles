# %s/unzip/CHANGETHIS/g
{
  flake.modules.homeManager.unzip =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.unzip ];
    };
}
