{ config, inputs, ... }:
let
  inherit (config.flake.modules) nixos;
  hm = config.flake.modules.homeManager;
in
{
  flake.modules.nixos.compositorCommon = {
    imports = [
      nixos.noctalia
      nixos.power
      nixos.security
    ];

  };

  flake.modules.homeManager.compositorCommon =
    { pkgs, ... }:
    {
      imports = [
        hm.cursor
        hm.idle
        hm.gtk
        hm.qt

        # ImageGlass photo viewer installed via flatpak
        hm.showtime # Video viewer
      ];

      home.packages = with pkgs; [
        hyprpicker # color picker

        # Screenshot
        grim # fullscreen screenshot
        slurp # Size of drawn area
        wayfreeze # Freeze screen

        # Notifications
        libnotify

        # Stream
        gnome-pomodoro
        gpu-screen-recorder
        pavucontrol # Control audio
      ];
    };
}
