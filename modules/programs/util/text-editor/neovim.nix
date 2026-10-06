{
  flake.modules.homeManager.neovim =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    {
      home.shellAliases = {
        nv = "nvim";
        nvconfig = "tmux-rename \'nvconfig\' \'pp-run ~/dotfiles/config/nvim/ \"$EDITOR .\"\'";
      };

      programs.neovim = {
        enable = true;
        defaultEditor = true;
        sideloadInitLua = true;
        extraLuaPackages = ps: [
          ps.jsregexp
        ];
      };

      xdg.configFile = {
        "nvim" = {
          source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/nvim";
        };
        # Unusable sadly, use as an idea
        # "markdownlint/config.json".text = lib.generators.toJSON { } {
        #   default = true;
        #   MD013 = false;
        # };
      };
    };
}
