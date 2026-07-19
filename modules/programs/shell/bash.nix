{
  flake.modules.nixos.bash =
    { config, pkgs, ... }:
    {
      programs.bash.enable = true;
      users.users.${config.primaryUser}.shell = pkgs.bash;
    };

  flake.modules.homeManager.bash = {
    programs.bash = {
      enable = true;
    };
  };
}
