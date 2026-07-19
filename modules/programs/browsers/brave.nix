{ pkgs, ... }:

{
  flake.modules.homeManager.brave =
    { pkgs, config, ... }:
    {
      imports = [
        ./_chromium-extensions.nix
      ];

      programs.brave = {
        enable = true;
        extensions = config.programs.chromium.extensions;
      };
    };
}
