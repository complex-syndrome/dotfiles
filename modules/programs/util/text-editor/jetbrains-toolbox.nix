{
  flake.modules.homeManager.jetbrains-toolbox =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        jetbrains-toolbox
      ];
    };
}
