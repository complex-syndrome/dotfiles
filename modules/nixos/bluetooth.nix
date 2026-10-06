{
  flake.modules.nixos.bluetooth =
    { pkgs, ... }:
    {
      hardware.bluetooth =
        let
          autoEnable = false;
        in
        {
          enable = true;
          powerOnBoot = autoEnable;

          # Let mouse reconnect successfully if auto-disconnect
          settings = {
            General = {
              FastConnectable = true;
              UserspaceHID = true;
            };
            Policy = {
              AutoEnable = autoEnable;
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
