{
  flake.modules.homeManager.zed-editor =
    { pkgs, ... }:
    {
      programs.zed-editor = {
        enable = true;
        extensions = [
          "nix"
        ];
        userSettings = {
          vim_mode = true;
          autosave = {
            after_delay = {
              milliseconds = 0;
            };
          };
          features = {
            copilot = false;
          };
          telemetry = {
            metrics = false;
          };
          auto_install_extensions = {
            nix = true;
          };
          icon_theme = "Zed (Default)";
          theme = {
            mode = "system";
            light = "Matugen Light";
            dark = "Matugen Dark";
          };
        };
      };

      home.packages = with pkgs; [
        nil
      ];
    };
}
