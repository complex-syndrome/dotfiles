{
  flake.modules.homeManager.nemo =
    { pkgs, lib, ... }:
    let
      actionsDir = ../../../config/nemo;

      # Returns attrset: { "compress.nemo_action" = "regular"; "extract.nemo_action" = "regular"; }
      actions = lib.attrsets.filterAttrs (
        name: type: type == "regular" && lib.strings.hasSuffix ".nemo_action" name
      ) (builtins.readDir actionsDir);

      mappings = lib.attrsets.mapAttrs' (name: value: {
        name = "nemo/actions/${name}";
        value = {
          source = "${actionsDir}/${name}";
        };
      }) actions;
    in
    {
      home.packages = with pkgs; [
        nemo
        file-roller
      ];

      # Actions
      xdg.dataFile = mappings;

      # Open In Terminal
      dconf.settings."org/cinnamon/desktop/applications/terminal" = {
        exec = "alacritty";
      };
    };
}
