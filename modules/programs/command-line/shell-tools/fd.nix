# %s/fd/CHANGETHIS/g
{
  flake.modules.homeManager.fd =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.fd ];
    };
}
