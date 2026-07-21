# %s/qbittorent/CHANGETHIS/g
{
  flake.modules.homeManager.qbittorent =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.qbittorent ];
    };
}
