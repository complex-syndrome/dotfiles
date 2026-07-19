# %s/keepassxc/CHANGETHIS/g
{
  flake.modules.homeManager.keepassxc =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.keepassxc ];
    };
}
