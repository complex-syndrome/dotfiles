{
  flake.modules.nixos.aliases =
    { config, ... }:
    {
      environment.shellAliases = {
        cls = "clear";
        nv = "nvim";

        l = "ls -alh";
        la = "ls -al";
        ll = "ls -l";

        wttr = "curl wttr.in";
        wttrp = "curl wttr.in/$1";
      };
    };
}
