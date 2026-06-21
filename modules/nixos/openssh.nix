{ ... }:

{
  flake.modules.nixos.openssh = {
    services.openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "prohibit-password";
        PubkeyAuthentication = true;
        PasswordAuthentication = false;
      };
    };
  };
}
