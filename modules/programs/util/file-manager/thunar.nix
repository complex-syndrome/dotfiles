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
          xfce4-exo # Open in terminal
          xfconf # Settings persistence
        ];
      };
      services.tumbler.enable = true; # Thumbnail

    };

  flake.modules.homeManager.thunar = {
    xdg.configFile."xfce4/helpers.rc".text = ''
      			TerminalEmulator=alacritty
      			'';
  };
}
