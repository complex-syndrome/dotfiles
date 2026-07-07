{
  flake.modules.nixos.bluetooth =
    { pkgs, ... }:
    {
      hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;

        # Let mouse reconnect successfully if auto-disconnect
        settings = {
          General = {
            FastConnectable = true;
            UserspaceHID = true;
          };
          Policy = {
            AutoEnable = true;
          };
        };
      };

      systemd.services.rfkill-unblock-bluetooth = {
        description = "Unblock Bluetooth rfkill";
        wantedBy = [ "multi-user.target" ];
        after = [ "systemd-udev-settle.service" ];
        serviceConfig = {
          Type = "oneshot";
          ExecStart = "${pkgs.util-linux}/bin/rfkill unblock bluetooth";
        };
      };
      services.blueman.enable = true;
    };
}
