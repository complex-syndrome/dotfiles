{ config, ... }:
let
  inherit (config.flake.modules)
    generic
    nixos
    homeManager
    ;
  commonImports = [
    generic.profile
    generic.primaryUser
    generic.primaryUserHome
    generic.nixSettings
  ];
in
{
  flake.modules.nixos.base = {
    imports = commonImports ++ [
      nixos.brave
      nixos.containers

      nixos.audio
      nixos.bluetooth
      nixos.boot

      nixos.fcitx5
      nixos.fonts

      nixos.kvm-qemu
      nixos.locale
      nixos.make
      nixos.networking
      nixos.openssh

      nixos.printing
      nixos.services

      nixos.sops
      nixos.tailscale

      nixos.users
    ];
    home-manager.sharedModules = [ homeManager.base ];
  };

  flake.modules.homeManager.base = {
    imports = [
      generic.profile
      homeManager.fonts
      homeManager.scripts
      homeManager.catppuccin
      homeManager.other-pkgs

      homeManager.alacritty

      homeManager.neovim
      homeManager.vscode

      homeManager.bash
      homeManager.bat
      homeManager.btop
      homeManager.eza
      homeManager.fastfetch
      homeManager.fzf
      homeManager.git
      homeManager.gh
      homeManager.go
      homeManager.gpg
      homeManager.wget

      homeManager.rofi-rbw
      homeManager.swappy
    ];
  };
}
