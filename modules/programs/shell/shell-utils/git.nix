{
  flake.modules.homeManager.git =
    { config, ... }:
    let
      profile = builtins.fromTOML (builtins.readFile ../../../enc/profile.toml);
    in
    {
      xdg.configFile."git/config-soton".text = ''
        [user]
          name = ${profile.git.soton.user_name}
          email = ${profile.git.soton.user_email}
      '';

      programs = {
        git = {
          enable = true;
          settings = {
            user = {
              name = profile.git.main.user_name;
              email = profile.git.main.user_email;
            };
            pull.rebase = true;
            init.defaultBranch = "main";

            "includeIf \"gitdir:~/soton/\"" = {
              path = "~/.config/git/config-soton";
            };
          };
          # TODO
          # signing = {
          #   key = config.profile.gitKey;
          #   signByDefault = true;
          # };
        };

        delta = {
          enable = true;
          enableGitIntegration = true;
          options = {
            keep-plus-minus-markers = true;
            line-numbers = true;
            navigate = true;
            width = 280;
          };
        };

        lazygit = {
          enable = true;

          settings = {
            gui = {
              showNumstatInFilesView = true;
            };

            git = {
              pagers = [
                {
                  colorArg = "always";
                  pager = "delta --paging=never";
                }
              ];
            };
          };
        };
      };
    };
}
