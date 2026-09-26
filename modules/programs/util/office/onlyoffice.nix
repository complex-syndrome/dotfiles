{
  flake.modules.homeManager.onlyoffice =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        onlyoffice-desktopeditors
      ];
    };
}
