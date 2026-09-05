{ inputs, ... }:
{
  flake.modules.homeManager.themes =
    {
      pkgs,
      config,
      ...
    }:
    let
      documents = "file://${config.home.homeDirectory}/Documents";
      downloads = "file://${config.home.homeDirectory}/Downloads";
      pictures = "file://${config.home.homeDirectory}/Pictures";
      videos = "file://${config.home.homeDirectory}/Videos";
      projects = "file://${config.home.homeDirectory}/Projects";

      qtFont = family: size: ''"${family},${toString size}"'';
      uiFont = qtFont config.profile.appearance.fonts.ui.family config.profile.appearance.fonts.ui.size;
      monospaceFont = qtFont config.profile.appearance.fonts.monospace.family config.profile.appearance.fonts.monospace.size;
    in
    {
      home.packages = [
        inputs.matugen.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];

      home.sessionVariables = {
        Projects = projects;
      };

      gtk = {
        enable = true;
        colorScheme = "dark";
        gtk2.force = true;
        gtk4.theme = config.profile.appearance.gtkTheme;
        theme = config.profile.appearance.gtkTheme;
        iconTheme = {
          inherit (config.profile.appearance.iconTheme) name;
          inherit (config.profile.appearance.iconTheme) package;
        };
        font = {
          name = config.profile.appearance.fonts.ui.family;
          inherit (config.profile.appearance.fonts.ui) size;
        };
        gtk3.bookmarks = [
          documents
          downloads
          pictures
          videos
          projects
        ];
        # gtk3.extraCss = ''@import url("file://${config.xdg.configHome}/gtk-3.0/matugen.css");'';
        # gtk4.extraCss = ''@import url("file://${config.xdg.configHome}/gtk-4.0/matugen.css");'';
        gtk3.extraCss = ''@import url("file://${config.xdg.configHome}/gtk-3.0/noctalia.css");'';
        gtk4.extraCss = ''@import url("file://${config.xdg.configHome}/gtk-4.0/noctalia.css");'';
      };

      # QT
      qt = {
        enable = true;
        platformTheme = {
          name = "qt6ct";
          package = pkgs.kdePackages.qt6ct;
        };

        qt6ctSettings = {
          Appearance = {
            # color_scheme_path = "${config.home.homeDirectory}/.config/qt6ct/colors/matugen.conf";
            color_scheme_path = "${config.home.homeDirectory}/.config/qt6ct/colors/noctalia.conf";
            custom_palette = true;
          };
          Fonts = {
            general = uiFont;
            fixed = monospaceFont;
          };
        };
      };

      xdg.configFile = {
        "matugen" = {
          source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/matugen";
        };
      };
    };
}
