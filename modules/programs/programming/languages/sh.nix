{
  flake.modules.homeManager.sh =
    { config, pkgs, ... }:
    {
      home.packages = with pkgs; [
        bash-language-server
        shfmt
      ];
    };
}
