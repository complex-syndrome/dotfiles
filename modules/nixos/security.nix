{
  flake.modules.nixos.security =
    { pkgs, ... }:
    {
      services.devmon.enable = true; # Auto mount drives

      security = {
        polkit = {
          enable = true;
          enablePkexecWrapper = true;
        };
      };

      environment.systemPackages = with pkgs; [
        lxqt.lxqt-policykit # Polkit gui
      ];
    };
}
