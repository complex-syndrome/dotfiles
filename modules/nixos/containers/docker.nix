{
  flake.modules.nixos.containers =
    { pkgs, ... }:
    {
      virtualisation.docker = {
        enable = true;
        enableOnBoot = true;
      };

      environment.systemPackages = with pkgs; [
        docker-compose
        lazydocker
      ];

      environment.shellAliases = {
        restart = "docker compose down && docker compose up -d";
        compose = "$EDITOR docker-compose.yml";
        attach = "docker attach $1 --detach-keys=\"ctrl-x\"";
        dcdown = "docker compose down";
        dcup = "docker compose up -d";
        lzd = "lazydocker";
      };
    };
}
