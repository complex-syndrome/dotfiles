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

          # Fix low FPS/stutter/FPS drops on Intel iGPU
          INTEL_GPU_MIN_FREQ_ON_AC = 500;
          INTEL_GPU_MIN_FREQ_ON_BAT = 300;
        };
      };

      logind.settings.Login.HandleLidSwitchExternalPower = "ignore";
    };
  };
}
