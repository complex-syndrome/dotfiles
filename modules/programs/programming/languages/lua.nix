{
  flake.modules.homeManager.lua =
    { config, pkgs, ... }:
    {
      home.packages = with pkgs; [
        lua5_1
        lua51Packages.luarocks
        lua51Packages.tree-sitter-cli
        lua51Packages.jsregexp
        lua-language-server
        stylua
      ];
    };
}
