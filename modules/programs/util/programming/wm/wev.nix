# %s/wev/CHANGETHIS/g
{
  flake.modules.homeManager.wev =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.wev ];
    };
}
