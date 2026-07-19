# %s/scrcpy/CHANGETHIS/g
{
  flake.modules.homeManager.scrcpy =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.scrcpy ];
    };
}
