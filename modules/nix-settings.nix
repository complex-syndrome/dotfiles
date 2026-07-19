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

          extra-substituters = [
            "https://noctalia.cachix.org"
            "https://vicinae.cachix.org"
          ];
          extra-trusted-public-keys = [
            "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
            "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
          ];
        };

        nixPath = [ "/etc/nix/path" ];
      };

      environment.etc = (
        lib.mapAttrs' (name: value: {
          name = "nix/path/${name}";
          value.source = value.flake;
        }) config.nix.registry
      );
    };

}
