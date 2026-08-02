{
  flake.modules.nixos.zsh =
    { pkgs, config, ... }:
    {
      programs.zsh = {
        enable = true;
      };

      users.users.${config.primaryUser}.shell = pkgs.zsh;
    };

  flake.modules.homeManager.zsh =
    { pkgs, config, ... }:
    {
      home.packages = [ pkgs.antidote ];

      # Performance hit when using antidote option to run zsh, not sure why
      # TODO: More extensions
      # FIX: Antidote and use-omz lagging issue
      # NOTE: Remember to rm -rf ~/.cache/antidote and antidote load to install new plugins
      home.file.".zsh_plugins.txt".text = ''
        ohmyzsh/ohmyzsh path:plugins/extract
        ohmyzsh/ohmyzsh path:plugins/dirhistory

        ohmyzsh/ohmyzsh path:plugins/fancy-ctrl-z

        fdellwing/zsh-bat
        Aloxaf/fzf-tab
        romkatv/zsh-bench kind:path
      '';

      programs.zsh = {
        enable = true;

        autocd = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        history = {
          findNoDups = true;
          expireDuplicatesFirst = true;
          ignoreAllDups = true;
          saveNoDups = true;
          share = true;
        };

        initContent = ''
          source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
          source ~/.p10k.zsh

          fpath=(${pkgs.antidote}/share/antidote/functions $fpath)
          autoload -Uz antidote

          if [[ ! ~/.zsh_plugins.zsh -nt ~/.zsh_plugins.txt ]]; then
            antidote bundle < ~/.zsh_plugins.txt >| ~/.zsh_plugins.zsh
          fi
          source ~/.zsh_plugins.zsh
          clear
        '';
      };

      home.file.".p10k.zsh".source =
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/powerlevel10k/.p10k.zsh";
    };
}
