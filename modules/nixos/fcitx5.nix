{
  flake.modules.nixos.fcitx5 =
    { pkgs, ... }:
    {
      i18n.inputMethod = {
        enable = true;
        type = "fcitx5";
        fcitx5.addons = with pkgs; [
          qt6Packages.fcitx5-chinese-addons # Simplified Pinyin, Bopomofo, and Tables
          fcitx5-mozc # Japanese Mozc input engine
          fcitx5-hangul # The Korean input engine
          fcitx5-gtk # Enables support for GTK apps (Chrome, Firefox, etc.)
          kdePackages.fcitx5-qt # Enables support for Qt/KDE apps
        ];
      };
      i18n.inputMethod.fcitx5.waylandFrontend = true;
    };
}
