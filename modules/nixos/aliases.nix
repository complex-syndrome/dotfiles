{
  flake.modules.nixos.aliases = {
    environment.shellAliases = {
      cls = "clear";
      nv = "nvim";
      py = "python3";

      ga = "git add .";
      gcm = "git commit -m";
      gs = "git status";
      gl = "git remote -v";

      ls = "eza --icons --git";
      lt = "ls -T";
      l = "ls -alh";
      la = "ls -al";
      ll = "ls -l";

      ff = "fastfetch";
      wttr = "curl wttr.in";
    };
  };
}
