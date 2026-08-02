{
  flake.modules.homeManager.python =
    { config, pkgs, ... }:
    {

      home = {
        shellAliases = {
          py = "python3";
        };
        packages = with pkgs; [
          python3
          ruff
        ];
      };
    };
}
