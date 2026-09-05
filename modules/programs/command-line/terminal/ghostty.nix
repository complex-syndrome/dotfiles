{
  flake.modules.homeManager.ghostty =
    { config, ... }:
    let
      pref = config.profile.appearance.fonts.terminal;
    in
    {
      programs.ghostty = {
        enable = true;
        settings = {
          command = "tmux attach || tmux";
          font-size = pref.size;

          font-family = pref.family;
          font-family-bold = pref.family;
          font-family-italic = pref.family;
          font-family-bold-italic = pref.family;

          # theme = "matugen";
          theme = "noctalia";

          background-opacity = 0.90;
          background-blur = true;
          unfocused-split-opacity = 0.5;
        };
      };
    };
}
