{
  flake.modules.homeManager.small-games =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        supertuxkart
      ];
    };
}
