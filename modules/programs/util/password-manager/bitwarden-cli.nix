# %s/bitwarden-cli/CHANGETHIS/g
{
  flake.modules.homeManager.bitwarden-cli =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.bitwarden-cli ];
    };
}
