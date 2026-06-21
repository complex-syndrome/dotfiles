{ inputs, config, ... }:
let
  inherit (config.flake.modules) nixos;
in
{
  configurations.nixos.nixos.module = {
    imports = [
      inputs.hardware.nixosModules.common-cpu-intel
      inputs.hardware.nixosModules.common-gpu-intel
      inputs.hardware.nixosModules.common-pc-ssd
      inputs.hardware.nixosModules.common-pc-laptop

      ./_hardware.nix
      nixos.base
      nixos.gaming

      nixos.kde-plasma
    ];

    primaryUser = "nixos";
    system.stateVersion = "26.05";
  };
}
