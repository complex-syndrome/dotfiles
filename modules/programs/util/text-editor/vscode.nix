{
  flake.modules.homeManager.vscode =
    { config, pkgs, ... }:
    {
      programs.vscode = {
        enable = true;
        # Optional: Specify a different package like pkgs.vscodium or pkgs.vscode.fhs
        # package = pkgs.vscode;

        # Install extensions from the overlay
        profiles.default.extensions = with pkgs.vscode-extensions; [
          jnoortheen.nix-ide
          tamasfe.even-better-toml
        ];

        #   # Declarative settings (maps to settings.json)
        #   userSettings = {
        #     "editor.formatOnSave" = true;
        #     "editor.fontSize" = 14;
        #   };
        #
        #   # Declarative keybindings (maps to keybindings.json)
        #   keybindings = [
        #     {
        #       key = "shift+cmd+j";
        #       command = "workbench.action.focusActiveEditorGroup";
        #       when = "terminalFocus";
        #     }
        #   ];
      };
    };
}
