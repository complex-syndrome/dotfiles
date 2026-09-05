# ~/.local/state/noctalia/settings.toml
# ~/.config/noctalia/config.toml
{ inputs, config, ... }:
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
      ...
    }:
    {
      imports = [ inputs.noctalia.homeModules.default ];

      programs.noctalia = {
        enable = true;
        systemd.enable = true;

        settings = {
          shell = {
            font_family = config.profile.appearance.fonts.ui.family;
            show_location = false;
            animation.enabled = false;

            niri_overview_type_to_launch_enabled = true; # Win + O and type something
            settings_show_advanced = true;

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
            source = "wallpaper";
            wallpaper_scheme = "soft";
            templates = {
              builtin_ids = [
                "btop"
                "gtk3"
                "gtk4"
                "ghostty"
                "niri"
                "qt"
              ];
              community_ids = [
                "brave"
                "discord"
                "vicinae"
              ];
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

          bar.default = {
            start = [
              "launcher"
              "wallpaper"
              "workspaces"
              "group:g1"
            ];
            end = [
              "tray"
              "clipboard"
              "notifications"
              "network"
              "bluetooth"
              "battery"
              "session"
            ];
            margin_edge = 0;
            margin_ends = 0;
            radius = 0;

            capsule_group = [
              {
                fill = "surface_variant";
                id = "g1";
                members = [
                  "media"
                  "audio_visualizer"
                ];
                opacity = 1.0;
                padding = 6.0;
              }
            ];
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
            media.hide_when_no_media = true;
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
            allow_empty_password = false;
            blur_intensity = 0.65;
          };
        };
      };
    };
}
