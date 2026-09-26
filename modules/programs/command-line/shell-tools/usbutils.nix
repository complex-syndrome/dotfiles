{
  flake.modules.homeManager.usbutils =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.usbutils ];
    };
}
