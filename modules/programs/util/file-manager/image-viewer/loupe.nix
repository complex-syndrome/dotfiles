{
  # Gnome default
  flake.modules.homeManager.loupe =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        loupe
      ];
    };
}

# Can try: TODO
# Shotwell
# IrfanView + Wine
# ImageGlass (beta)
# ClassicImageViewer
# XnViewMP
