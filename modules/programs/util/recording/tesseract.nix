{
  flake.modules.homeManager.tesseract =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.tesseract ];
    };
}
