# %s/poppler/CHANGETHIS/g
{
  flake.modules.homeManager.poppler =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.poppler-utils ];
    };
}
