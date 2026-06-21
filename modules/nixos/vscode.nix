{
  flake.modules.nixos.vscode =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        nixfmt
        (vscode-with-extensions.override {
          vscode = vscode; # or vscodium
          vscodeExtensions = with vscode-extensions; [
            jnoortheen.nix-ide
            catppuccin.catppuccin-vsc
            tamasfe.even-better-toml
          ];
        })
      ];
    };
}
