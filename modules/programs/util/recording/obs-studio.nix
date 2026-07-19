{
  flake.modules.homeManager.obs-studio =
    { pkgs, ... }:
    {
      # TODO Can test some obs-do / obs-cli / obs-cmd
      programs.obs-studio = {
        enable = true;
        # plugins = with pkgs.obs-studio-plugins; [
        #   obs-move-transition
        # ];
      };
    };
}
