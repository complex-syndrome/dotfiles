# BUG: krita keeps opening docs browser
{
  flake.modules.homeManager.krita =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.krita ];
    };
}
