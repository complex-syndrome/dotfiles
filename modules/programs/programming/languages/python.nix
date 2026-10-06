{
  flake.modules.homeManager.python =
    { config, pkgs, ... }:
    {

      home = {
        shellAliases = {
          py = "python3";
          venv = ". $PWD/.venv/bin/activate";
        };
        packages = with pkgs; [
          (python3.withPackages (
            ps: with ps; [
              libevdev
              jupyter
              pip
            ]
          ))
          ruff
          uv
        ];
      };
    };
}
