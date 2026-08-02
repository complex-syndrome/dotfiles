{
  flake.modules.homeManager.json =
    { config, pkgs, ... }:
    {
      home.packages = with pkgs; [
        jq
      ];
    };
}
