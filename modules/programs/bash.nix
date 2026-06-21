{
  flake.modules.nixos.bash =
    { config, pkgs, ... }:
    {
      programs.bash.enable = true;
      users.users.${config.primaryUser}.shell = pkgs.bash;
    };

  flake.modules.homeManager.bash =
    { pkgs, ... }:
    {
      programs.bash = {
        enable = true;

        shellAliases = {
          cls = "clear";

          nv = "nvim";
          py = "python3";

          ga = "git add .";
          gcm = "git commit -m";

          ls = "eza --icons --git";
          tree = "ls -T";

          l = "ls -alh";
          la = "ls -al";
          ll = "ls -l";

          ff = "fastfetch";
          wttr = "curl wttr.in";
        };
      };
    };
}
