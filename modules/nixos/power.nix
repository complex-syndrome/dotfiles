{
  flake.modules.nixos.power = {
    services = {
      thermald.enable = true;

      tlp = {
        enable = true;
        pd.enable = true;
        settings = {
          PLATFORM_PROFILE_ON_BAT = "powersave";
          # Use tlp-stat -b to check the available parameters
          STOP_CHARGE_THRESH_BAT0 = 1;
        };
      };

      logind.settings.Login.HandleLidSwitchExternalPower = "ignore";
    };
  };
}
