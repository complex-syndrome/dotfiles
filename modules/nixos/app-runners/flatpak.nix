{ config, ... }:
{
  flake.modules.nixos.flatpak = { pkgs, ... }: {
    home-manager.sharedModules = [ config.flake.modules.homeManager.flatpak ];
    services.flatpak.enable = true;
    # 1. Install the flatpak file
    # 2. flatpak --user install /path/to/your/app.flatpak
    # 3. flatpak run #app.id / Use your launcher
  };

  flake.modules.homeManager.flatpak = {
    home.sessionVariables = {
      XDG_DATA_DIRS = "$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share";
    };
  };
}
