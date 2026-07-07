{
  flake.modules.homeManager.rofi-rbw =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        rofi

        wtype
        rofi-rbw

        pinentry-rofi
      ];

      programs.rbw =
        let
          profile = builtins.fromTOML (builtins.readFile ../enc/profile.toml);
        in
        {
          enable = true;
          settings = {
            email = profile.user.email;
            pinentry = pkgs.pinentry-rofi;
          };
        };

      services.gpg-agent = {
        enable = true;
        pinentry.package = pkgs.pinentry-rofi;
      };
    };
}
