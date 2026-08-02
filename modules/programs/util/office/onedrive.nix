{
  flake.modules.homeManager.onedrive =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        onedrive
      ];
    };
}
