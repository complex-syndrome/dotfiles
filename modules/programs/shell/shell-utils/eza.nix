{
  flake.modules.homeManager.eza = {
    programs.eza = {
      enable = true;
      enableBashIntegration = false;
      enableZshIntegration = false;
      enableFishIntegration = false;
    };
  };
}
