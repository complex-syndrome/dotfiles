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
        };
      };

      home.packages = with pkgs; [
        nil
      ];
    };
}
