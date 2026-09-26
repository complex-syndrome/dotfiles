# %s/zip/CHANGETHIS/g
{
  flake.modules.homeManager.zip =
    { pkgs, ... }:
    {
      home.shellAliases = {
        zip = "zip -r";
      };
      home.packages = [ pkgs.zip ];
    };
}
