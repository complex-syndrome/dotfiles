{
  flake.modules.homeManager.neovim =
    {
      config,
      pkgs,
      ...
    }:
    {
      programs.neovim = {
        enable = true;
        defaultEditor = true;
        sideloadInitLua = true;

        # plugins = with pkgs.vimPlugins; [
        #   (luasnip.overrideAttrs (oldAttrs: {
        #     buildInputs = oldAttrs.buildInputs ++ [ pkgs.lua51Packages.jsregexp ];
        #   }))
        # ];
      };

      xdg.configFile = {
        "nvim" = {
          source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/nvim";
        };
      };
    };
}
