{
  flake.modules.homeManager.ghostty =
    { config, ... }:
    {
      programs.ghostty.enable = true;

      xdg.configFile = {
        "ghostty" = {
          source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/ghostty";
        };
      };
    };
}
