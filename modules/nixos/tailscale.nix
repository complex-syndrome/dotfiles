{
  flake.modules.nixos.tailscale =
    { config, ... }:
    {
      services.tailscale = {
        enable = true;
        authKeyFile = config.sops.secrets."api_keys/tailscale".path;
      };

      # https://tailscale.com/blog/nixos-minecraft
      # Nice reference but not used currently
    };
}
