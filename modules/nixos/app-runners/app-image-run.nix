{
  flake.modules.nixos.appImageRun = { pkgs, ... }: {
    programs.appimage.enable = true;
    programs.appimage.binfmt = true;
    # TODO can try appman https://github.com/ivan-hc/AppMan
  };
}
