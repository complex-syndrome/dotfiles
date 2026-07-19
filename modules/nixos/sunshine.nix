{
  # not suitable for niri (no super and mouse directed)
  # niche use case
  flake.modules.nixos.sunshine =
    { config, ... }:
    {
      services.sunshine = {
        enable = true;
        capSysAdmin = true; # Required for Wayland screen capturing
        openFirewall = true; # Opens the required ports for the connection
      };

      networking.firewall.allowedTCPPorts = [
        47989
        47990
        47991
      ];
      networking.firewall.allowedUDPPorts = [
        47998
        47999
        48000
      ];
      services.avahi.publish.enable = true;
      services.avahi.publish.userServices = true;

    };
}
