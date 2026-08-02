{
  flake.modules.homeManager.markdown =
    { config, pkgs, ... }:
    {
      home.packages = with pkgs; [
        markdownlint-cli
      ];
    };
}
