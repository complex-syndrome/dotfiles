{
  flake.modules.homeManager.eza = {
    programs.eza = {
      enable = true;
      enableBashIntegration = false;
      enableZshIntegration = false;
      enableFishIntegration = false;
    };

    home.shellAliases = {
      ls = "eza --icons --git";
      lt = "ls -T";
    };

  };
}
