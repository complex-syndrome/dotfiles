# %s/wayvnc/CHANGETHIS/g
{
  flake.modules.homeManager.wayvnc =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.wayvnc ];
    };
}
