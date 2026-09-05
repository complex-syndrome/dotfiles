{ config, ... }:
{
  flake.modules.nixos.thunar =
    { pkgs, ... }:
    {
      home-manager.sharedModules = [ config.flake.modules.homeManager.thunar ];

      programs.thunar = {
        enable = true;
        plugins = with pkgs; [
          thunar-archive-plugin # Compress / Extract
          file-roller

          thunar-media-tags-plugin # Media
          thunar-volman # Removable media
          xfconf # Settings persistence
        ];
      };
      services.tumbler.enable = true; # Thumbnail

    };

  flake.modules.homeManager.thunar =
    { pkgs, config, ... }:
    {
      xdg.configFile = {
        "xfce4/helpers.rc".text = "TerminalEmulator=ghostty";
        "xfce4/xfconf/xfce-perchannel-xml/thunar.xml" = {
          # If settings are overriden via gui, this symlink will not work until switching again
          source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/thunar/thunar.xml";
          force = true;
        };
      };

      home.activation.reloadXfconf = config.lib.dag.entryAfter [ "writeBoundary" ] ''
        $DRY_RUN_CMD ${pkgs.xfconf}/bin/xfconfd --replace || true
      '';
    };
}
