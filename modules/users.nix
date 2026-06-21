{
  flake.modules.nixos.users =
    { config, ... }:
    {
      users.users.${config.primaryUser} =
        # let
        #   secrets = builtins.fromTOML (builtins.readFile ./enc/secrets.toml);
        # in
        {
          description = config.primaryUser;
          extraGroups = [
            "networkmanager"
            "video"
            "wheel"
            "docker"
          ];
          isNormalUser = true;

          # openssh.authorizedKeys.keyFiles = [
          #   config.sops.secrets."ssh/mobile".path
          # ];
        };

      system.activationScripts.setUserAvatar.text = ''
        mkdir -p /var/lib/AccountsService/{icons,users}
        cp ${config.profile.avatar} "/var/lib/AccountsService/icons/${config.primaryUser}"

        touch "/var/lib/AccountsService/users/${config.primaryUser}"

        if ! grep -q "^Icon=" "/var/lib/AccountsService/users/${config.primaryUser}"; then
          if ! grep -q "^\[User\]" "/var/lib/AccountsService/users/${config.primaryUser}"; then
            echo "[User]" >> "/var/lib/AccountsService/users/${config.primaryUser}"
          fi
          echo "Icon=/var/lib/AccountsService/icons/${config.primaryUser}" >> "/var/lib/AccountsService/users/${config.primaryUser}"
        fi
      '';

      security.sudo.wheelNeedsPassword = false;

    };
}
