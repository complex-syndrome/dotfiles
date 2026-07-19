{
  flake.modules.nixos.trash = {
    services.gvfs.enable = true; # Trash
    # services.avahi.enable = true;
  };
}
