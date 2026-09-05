# %s/file/CHANGETHIS/g
{
  flake.modules.homeManager.file =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.file ];
    };
}
