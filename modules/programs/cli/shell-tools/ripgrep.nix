# %s/ripgrep/CHANGETHIS/g
{
  flake.modules.homeManager.ripgrep =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.ripgrep ];
    };
}
