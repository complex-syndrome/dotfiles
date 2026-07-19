{
  flake.modules.nixos.steam =
    { pkgs, ... }:
    {
      programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        extraCompatPackages = [ pkgs.proton-ge-bin ];
        package = pkgs.steam.override {
          extraArgs = "-cef-disable-gpu-compositing";
        };
      };

      boot.kernelParams = [
        "split_lock_detect=off"
        "vsyscall=emulate"
      ];

      services.pipewire.extraConfig.pipewire."10-gaming" = {
        "context.properties" = {
          "default.clock.quantum" = 256;
          "default.clock.min-quantum" = 256;
        };
      };
    };
}
