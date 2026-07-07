{
  flake.modules.homeManager.alacritty =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      programs.alacritty = {
        enable = true;
        settings = {
          general = {
            live_config_reload = true;
          };

          terminal = {
            shell.program = "${pkgs.bash}/bin/bash";
            # shell.args = [
            #   "-l"
            #   "-c"
            #   "tmux attach || tmux"
            # ];
          };

          window = {
            decorations = "none";
            dynamic_title = false;
            dynamic_padding = true;
            dimensions = {
              columns = 170;
              lines = 45;
            };
            padding = {
              x = 5;
              y = 1;
            };
          };

          scrolling = {
            history = 10000;
            multiplier = 3;
          };

          font = {
            size = config.profile.appearance.fonts.terminal.size.linux;
            normal = {
              inherit (config.profile.appearance.fonts.terminal) family;
              style = "Regular";
            };
            bold = {
              inherit (config.profile.appearance.fonts.terminal) family;
              style = "Bold";
            };
            italic = {
              inherit (config.profile.appearance.fonts.terminal) family;
              style = "Italic";
            };
            bold_italic = {
              inherit (config.profile.appearance.fonts.terminal) family;
              style = "Bold Italic";
            };
          };

          selection = {
            semantic_escape_chars = '',│`|:"' ()[]{}<>'';
            save_to_clipboard = true;
          };
        };
      };
    };
}
