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
      nixos.containers
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

      nixos.localsend
    ];
    home-manager.sharedModules = [ homeManager.base ];
  };

  flake.modules.homeManager.base = {
    imports = [
      generic.profile
      hm.brave

      hm.fonts
      hm.scripts
      hm.themes

      hm.other-pkgs

      hm.ghostty

      hm.obsidian
      hm.timeshift

      hm.neovim
      hm.zed-editor
      hm.jetbrains-toolbox

      hm.devenv
      hm.zsh
      hm.atuin
      hm.caligula
      hm.usbutils
      hm.bat
      hm.btop
      hm.eza
      hm.fastfetch
      hm.fzf
      hm.git
      hm.gh
      hm.wget
      hm.fd
      hm.ripgrep
      hm.unzip
      hm.zip
      hm.zoxide
      hm.tmux

      hm.libreoffice
      hm.zathura
      hm.krita

      hm.go
      hm.java
      hm.json
      hm.kdl-niri
      hm.lua
      hm.markdown
      hm.nix
      hm.python
      hm.rust
      hm.sh

      hm.obs-studio
      hm.swappy
      hm.tesseract

      hm.discord
      hm.heroic
      # steam at nixos

      hm.wayvnc
      hm.scrcpy

      hm.vicinae

      hm.bitwarden-cli
      hm.keepassxc

      # hm.gpg
    ];
  };
}
