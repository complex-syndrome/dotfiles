# %s/template/CHANGETHIS/g
{
  flake.modules.homeManager.template =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.template ];
    };
}
