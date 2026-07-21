{
  flake.modules.homeManager.other-pkgs =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        # lua
        lua5_1
        lua51Packages.luarocks
        lua51Packages.tree-sitter-cli
        lua51Packages.jsregexp
        lua-language-server
        stylua

        # json
        jq

        # rust
        rustup

        # kdl (niri)
        kdlfmt

        # python
        python3
        ruff

        # nix
        nixd
        nixfmt

        # bash
        bash-language-server

        # go
        gopls
        gotools

        # md
        markdownlint-cli

        # other
        hadolint
        prettier
        pyright
        shellcheck
        shfmt
        tflint
        tofu-ls
        tree-sitter
        typescript-language-server
        vscode-langservers-extracted
        yaml-language-server

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
