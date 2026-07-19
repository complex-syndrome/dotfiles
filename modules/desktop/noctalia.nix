{ config, inputs, ... }:
let
  hm = config.flake.modules.homeManager;
in
{
  flake.modules.nixos.noctalia = {
    home-manager.sharedModules = [ hm.noctalia ];
    services.upower.enable = true;
  };

  flake.modules.homeManager.noctalia =
    {
      config,
      catppuccinColor,
      ...
    }:
    let
      inherit (config.profile.appearance) catppuccin;
      uiFont = config.profile.appearance.fonts.ui.family;

      color = catppuccinColor;
      accentColor = color catppuccin.accent;

      catppuccinPalette = {
        dark = {
          mPrimary = accentColor;
          mOnPrimary = color "crust";
          mSecondary = color "pink";
          mOnSecondary = color "crust";
          mTertiary = color "mauve";
          mOnTertiary = color "crust";
          mError = color "red";
          mOnError = color "crust";
          mSurface = color "base";
          mOnSurface = color "text";
          mSurfaceVariant = color "surface0";
          mOnSurfaceVariant = color "subtext0";
          mOutline = color "overlay0";
          mShadow = color "crust";
          mHover = accentColor;
          mOnHover = color "crust";
          terminal = {
            background = color "base";
            foreground = color "text";
            cursor = color "rosewater";
            cursorText = color "base";
            selectionBg = color "surface2";
            selectionFg = color "text";
            normal = {
              black = color "surface1";
              red = color "red";
              green = color "green";
              yellow = color "yellow";
              blue = color "blue";
              magenta = color "pink";
              cyan = color "teal";
              white = color "subtext1";
            };
            bright = {
              black = color "surface2";
              red = color "red";
              green = color "green";
              yellow = color "yellow";
              blue = color "blue";
              magenta = color "pink";
              cyan = color "teal";
              white = color "subtext0";
            };
          };
        };
      };
    in
    {
      imports = [ inputs.noctalia.homeModules.default ];

      programs.noctalia = {
        enable = true;
        systemd.enable = true;
        customPalettes."catppuccin-custom" = catppuccinPalette;

        settings = {
          shell = {
            font_family = uiFont;
            show_location = false;

            animation.enabled = false;

            panel = {
              launcher_categories = false;
              launcher_session_search = true;
            };

            screenshot = {
              pipe_command = "swappy -f -";
              pipe_to_command = true;
              save_to_file = false;
            };
          };

          theme = {
            source = "custom";
            custom_palette = "catppuccin-custom";
            templates = {
              enable_builtin_templates = false;
              enable_community_templates = false;
            };
          };

          idle = {
            behavior_order = [
              "lock"
              "screen-off"
              # "lock-and-suspend"
            ];
            pre_action_fade_seconds = 0;

            behavior = {
              screen-off = {
                action = "screen_off";
                enabled = true;
                timeout = 300;
              };

              lock = {
                action = "lock";
                enabled = true;
                timeout = 600;
              };

              lock-and-suspend = {
                action = "lock_and_suspend";
                enabled = false;
                timeout = 3600;
              };
            };
          };

          widget = {
            battery = {
              display_mode = "graphic";
              show_label = true;
            };
            clock.format = "{:%H:%M %a, %e %B %Y}";
            network.show_label = false;
            tray.drawer = true;
            volume.show_label = false;
            brightness.show_label = false;
            workspaces.hide_when_empty = true;
          };

          wallpaper = {
            default.path = config.profile.wallpaper;
          };

          backdrop = {
            enabled = true;
            blur_intensity = 0.3;
            tint_intensity = 0.3;
          };

          lockscreen = {
            enabled = true;
            fingerprint = true;
            allow_empty_password = false;
          };
        };
      };
    };
}
