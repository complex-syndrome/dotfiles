# %s/proton-vpn/CHANGETHIS/g
{
  flake.modules.homeManager.proton-vpn =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.proton-vpn ];
    };
}
