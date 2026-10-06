{
  flake.modules.nixos.networking = {
    networking.networkmanager.enable = true;

    environment.shellAliases = {
      port = "netstat -antu";
    };

		networking.firewall.allowedUDPPorts = [ 8889 8890 11111 ];
  };
}
