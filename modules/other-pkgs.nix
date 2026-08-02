{
  flake.modules.homeManager.other-pkgs =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        hadolint
        prettier
        pyright
        shellcheck
        tflint
        tofu-ls
        tree-sitter
        typescript-language-server
        vscode-langservers-extracted
        yaml-language-server
        gcc

        lazygit
        imagemagick
        ghostscript
        tectonic
        mermaid-cli

        sqlite
        wl-clipboard
        tesseract
      ];
    };
}
