{
  flake.modules.homeManager.fuzzel =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        fuzzel
      ];
    };
}
