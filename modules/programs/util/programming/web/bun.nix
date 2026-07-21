# %s/bun/CHANGETHIS/g
{
  flake.modules.homeManager.bun =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.bun ];
    };
}
