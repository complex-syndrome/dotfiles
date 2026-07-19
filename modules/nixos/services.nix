{
  flake.modules.nixos.services = {
    # Increase boot times by removing stuff
    systemd.services = {
      NetworkManager-wait-online.enable = false; # Wait for online before start
      plymouth-quit-wait.enable = false; # Logo splash screen
    };
  };
}
