{
  flake.modules.homeManager.gh =
    { pkgs, ... }:
    {
      programs.gh = {
        enable = true;

        # Settings to write to the config.yml
        settings = {
          git_protocol = "ssh";
          prompt = "enabled";
        };

        extensions = with pkgs; [
          gh-dash # A beautiful dashboard for PRs and issues
          gh-eco # Explore the ecosystem
        ];
      };
    };
}
