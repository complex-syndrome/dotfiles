{ inputs, ... }:
{
  flake.modules.generic.nixSettings =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      nixpkgs.config.allowUnfree = true;

      system.autoUpgrade = {
        enable = true;
        dates = "weekly";
      };

      nix = {
        registry = lib.mapAttrs (_: flake: { inherit flake; }) (
          lib.filterAttrs (_: lib.isType "flake") inputs
        );

        settings = {
          experimental-features = [
            "nix-command"
            "flakes"
          ];
          auto-optimise-store = true;
        };

        nixPath = [ "/etc/nix/path" ];

        gc = {
          automatic = true;
          dates = "weekly";
          options = "--delete-older-than 15";
        };
      };

      environment.etc = (
        lib.mapAttrs' (name: value: {
          name = "nix/path/${name}";
          value.source = value.flake;
        }) config.nix.registry
      );
    };

}
