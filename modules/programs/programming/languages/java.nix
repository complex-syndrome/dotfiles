{
  flake.modules.homeManager.java =
    { config, pkgs, ... }:
    {
      # Just use IntelliJ IDE
      programs.java = {
        enable = true;
      };
    };
}
