{ pkgs, ... }:

{
  flake.modules.homeManager.chrome =
    { pkgs, ... }:
    {
      imports = [
        ./_chromium-extensions.nix
      ];

      home.packages = with pkgs; [
        google-chrome
      ];
    };
}
