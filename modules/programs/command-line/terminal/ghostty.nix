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
        };
      };
    };
}
