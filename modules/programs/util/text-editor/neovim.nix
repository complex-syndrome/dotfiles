{
  flake.modules.homeManager.neovim =
    {
      config,
      pkgs,
      ...
    }:
    {
      home.shellAliases = {
        nv = "nvim";
      };

      programs.neovim = {
        enable = true;
        defaultEditor = true;
        sideloadInitLua = true;
      };

      xdg.configFile = {
        "nvim" = {
          source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/nvim";
        };
      };
    };
}
