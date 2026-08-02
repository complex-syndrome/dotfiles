{
  flake.modules.homeManager.kdl-niri =
    { config, pkgs, ... }:
    {
      home.packages = with pkgs; [
        kdlfmt
      ];
    };
}
