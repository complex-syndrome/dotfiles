# %s/localsend/CHANGETHIS/g
{
  flake.modules.homeManager.localsend =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.localsend ];
    };
}
