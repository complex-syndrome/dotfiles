{
  flake.modules.homeManager.rust =
    { config, pkgs, ... }:
    {
      home.packages = with pkgs; [
        rustup
      ];
    };
}
