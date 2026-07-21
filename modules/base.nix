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
  hm = config.flake.modules.homeManager;
in
{
  flake.modules.nixos.base = {
    imports = commonImports ++ [
      nixos.steam
      # nixos.containers
      nixos.trash

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

      nixos.appImageRun
      nixos.flatpak

      nixos.thunar
      nixos.zsh
    ];
    home-manager.sharedModules = [ homeManager.base ];
  };

  flake.modules.homeManager.base = {
    imports = [
      generic.profile
      hm.brave

      hm.fonts
      hm.scripts
      hm.catppuccin
      hm.other-pkgs

      hm.alacritty
      hm.obsidian
      hm.timeshift

      homeManager.godot
      # homeManager.aseprite
      hm.blender

      hm.neovim
      hm.zed-editor

      hm.zsh
      hm.atuin
      hm.bat
      hm.btop
      hm.eza
      hm.fastfetch
      hm.fzf
      hm.git
      hm.gh
      hm.go
      hm.gpg
      hm.wget
      hm.fd
      hm.ripgrep
      hm.unzip
      hm.zip
      hm.zoxide
      hm.tmux

      hm.obs-studio
      hm.swappy

      hm.discord
      hm.heroic
      # steam at nixos

      hm.wayvnc
      hm.localsend
      hm.scrcpy

      hm.vicinae

      hm.bitwarden-cli
      hm.keepassxc
    ];
  };
}
