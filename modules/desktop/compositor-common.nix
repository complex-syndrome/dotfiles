{ config, ... }:
let
  hm = config.flake.modules.homeManager;
in
{
  flake.modules.nixos.compositorCommon = {
    services = {
      displayManager.gdm.enable = true;
      upower.enable = true;
      gnome.gnome-keyring.enable = true;

      tlp = {
        enable = true;
        pd.enable = true;
        settings = {
          # Use tlp-stat -b to check the available parameters
          STOP_CHARGE_THRESH_BAT0 = 1;
        };
      };
    };

    security = {
      polkit.enable = true;
      pam.services.gdm.enableGnomeKeyring = true;
    };
  };

  flake.modules.homeManager.compositorCommon =
    { pkgs, ... }:
    {
      imports = [
        hm.noctalia
        hm.idle
        hm.swappy
        hm.gtk
        hm.qt
      ];

      home.packages = with pkgs; [
        file-roller
        gnome-calculator
        gnome-pomodoro
        gpu-screen-recorder
        grim
        hyprpicker
        libnotify
        loupe
        nautilus
        pavucontrol
        seahorse
        showtime
        slurp
        wayfreeze
      ];
    };
}
