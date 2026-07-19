# %s/zip/CHANGETHIS/g
{
  flake.modules.homeManager.zip =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.zip ];
    };
}
