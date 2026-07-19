{ inputs, ... }:
{
  flake.modules.homeManager.vicinae =
    { pkgs, config, ... }:
    {
      imports = [ inputs.vicinae.homeManagerModules.default ];

      programs.vicinae = {
        enable = true;
        systemd = {
          enable = true;
          autoStart = true;
        };

        settings = {
          favorites = [
            "clipboard:history"
            "core:settings"
            "@jomifepe/store.raycast.bitwarden:search"
            "@knoopx/store.vicinae.nix:packages"
            "@knoopx/store.vicinae.nix:options"
          ];
          launcher_window = {
            blur.enabled = true;
            material = "auto";
          };
          theme = {
            dark = {
              iconTheme = "Catppuccin Mocha Lavender";
              name = "catppuccin-mocha";
            };
            light = {
              iconTheme = "Catppuccin Mocha Lavender";
              name = "catppuccin-mocha";
            };
          };

          providers = {
            applications = {
              defaultAction = "launch";
              launchPrefix = "sh";
              entrypoints = {
                Alacritty = {
                  alias = "terminal cmd shell";
                };
                "dev.noctalia.Noctalia" = {
                  enabled = false;
                };
                vicinae = {
                  enabled = false;
                };
                timeshift-gtk = {
                  alias = "backup";
                };
                brave-browser = {
                  alias = "google chrome browser";
                };
                fcitx5-configtool = {
                  enabled = false;
                };
                nixos-manual = {
                  enabled = false;
                };
                nvim = {
                  enabled = false;
                };
                "org.fcitx.Fcitx5" = {
                  enabled = false;
                };
                "org.fcitx.fcitx5-migrator" = {
                  enabled = false;
                };
                "org.pulseaudio.pavucontrol" = {
                  enabled = false;
                };
                scrcpy = {
                  enabled = false;
                };
                scrcpy-console = {
                  alias = "android";
                };
                tectonic = {
                  enabled = false;
                };
              };
              core = {
                entrypoints = {
                  about = {
                    enabled = false;
                  };
                  inspect-local-storage = {
                    enabled = false;
                  };
                  search-builtin-icons = {
                    alias = "emoji";
                  };
                  search-emojis = {
                    alias = "icon";
                  };
                };
              };
            };
            "@Gelei/store.vicinae.bluetooth" = {
              preferences = {
                connectionToggleable = true;
              };
            };
            "@bl4zee1g/store.vicinae.kaomojis" = {
              entrypoints = {
                kaomoji = {
                  alias = "emoji icon";
                };
              };
            };
            "@jomifepe/store.raycast.bitwarden" = {
              preferences = {
                cliPath = "/etc/profiles/per-user/nixos/bin/bw";
                fetchFavicons = true;
                repromptIgnoreDuration = "-1";
                serverUrl = "";
                shouldCacheVaultItems = true;
                syncOnLaunch = true;
                windowActionOnCopy = "close";
              };
              entrypoints = {
                create-folder = {
                  enabled = true;
                };
                create-send = {
                  enabled = true;
                };
                generate-password-quick = {
                  enabled = true;
                };
                receive-send = {
                  enabled = true;
                };
                search-sends = {
                  enabled = true;
                };
              };
            };
            "@josephschmitt/store.raycast.gif-search" = {
              preferences = {
                defaultAction = "copyFile";
                downloadPath = "";
                giphyLocale = "en";
                gridItemSize = "medium";
                gridTrendingItemSize = "medium";
                hideFilename = false;
                klipyLocale = "en";
                maxResults = "20";
              };
            };
            "@knoopx/store.vicinae.niri" = {
              enabled = false;
              entrypoints = {
                clear-dynamic-cast-target = {
                  enabled = true;
                };
                layers = {
                  enabled = true;
                };
                outputs = {
                  enabled = true;
                };
                pick-color = {
                  enabled = true;
                };
                power-off-monitors = {
                  enabled = true;
                };
                windows = {
                  enabled = true;
                };
                workspaces = {
                  enabled = true;
                };
              };
            };
            "@leonkohli/store.vicinae.process-manager" = {
              preferences = {
                clear-search-after-kill = false;
                close-window-after-kill = false;
                process-limit = "100";
                refresh-interval = "2000";
                search-in-paths = true;
                search-in-pid = true;
                show-path = false;
                show-pid = true;
                show-system-processes = false;
                sort-by-memory = true;
              };
            };
            browser-extension = {
              entrypoints = {
                shortcut-active-tab = {
                  enabled = true;
                };
              };
            };
            clipboard = {
              entrypoints = {
                clear = {
                  enabled = false;
                };
                clear-history = {
                  enabled = false;
                };
              };
            };
            core = {
              entrypoints = {
                about = {
                  enabled = false;
                };
                documentation = {
                  enabled = false;
                };
                keybind-settings = {
                  enabled = false;
                };
                manage-fallback = {
                  enabled = false;
                };
                open-config-file = {
                  enabled = false;
                };
                open-default-config = {
                  enabled = false;
                };
                refresh-apps = {
                  enabled = false;
                };
                report-bug = {
                  enabled = false;
                };
                sponsor = {
                  enabled = false;
                };
              };
            };
            developer = {
              entrypoints = {
                create = {
                  enabled = false;
                };
              };
            };
            font = {
              entrypoints = {
                browse = {
                  enabled = false;
                };
              };
            };
            power = {
              entrypoints = {
                hibernate = {
                  enabled = false;
                };
                soft-reboot = {
                  enabled = false;
                };
                suspend = {
                  enabled = false;
                };
              };
            };
            raycast-compat = {
              entrypoints = {
                store = {
                  alias = "extensions";
                };
              };
            };
            scripts = {
              preferences = {
                customDirs = [
                  "/home/nixos/dotfiles/config/vicinae/scripts"
                ];
              };
            };
            system = {
              entrypoints = {
                browse-apps = {
                  enabled = true;
                };
                toggle-mute = {
                  enabled = false;
                };
                volume-0 = {
                  enabled = false;
                };
                volume-100 = {
                  enabled = false;
                };
                volume-25 = {
                  enabled = false;
                };
                volume-50 = {
                  enabled = false;
                };
                volume-75 = {
                  enabled = false;
                };
                volume-down = {
                  enabled = false;
                };
                volume-up = {
                  enabled = false;
                };
              };
            };
            theme = {
              entrypoints = {
                set = {
                  enabled = false;
                };
              };
            };
          };
        };
      };

      xdg.configFile."BraveSoftware/Brave-Browser/NativeMessagingHosts/com.vicinae.vicinae.json".text =
        builtins.toJSON
          {
            name = "com.vicinae.vicinae";
            description = "Vicinae Native Messaging Host";
            path = "${pkgs.vicinae}/bin/vicinae";
            type = "stdio";
            allowed_origins = [
              "chrome-extension://kcmipingpfbohfjckomimmahknoddnke/"
            ];
          };
    };
}
