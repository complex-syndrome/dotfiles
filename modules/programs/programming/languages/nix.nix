{
  flake.modules.homeManager.nix =
    { config, pkgs, ... }:
    {
      home.packages = with pkgs; [
        nixd
        nixfmt
      ];
    };
}
