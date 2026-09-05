{
  flake.modules.homeManager.btop = {
    programs.btop = {
      enable = true;
      settings = {
        vim_keys = true;
        proc_sorting = "memory";
        color_theme = "noctalia";
        # color_theme = "matugen";
      };
    };
  };
}
