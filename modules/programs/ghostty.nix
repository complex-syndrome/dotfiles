{
  flake.modules.homeManager.ghostty =
    { config, ... }:
    {
      programs.ghostty.enable = true;
    };
}
