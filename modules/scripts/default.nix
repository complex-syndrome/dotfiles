{
  flake.modules.homeManager.scripts =
    { lib, pkgs, ... }:
    let
      scriptNames = [
        "cd-to-project"
        "fif"
        "fkill"
        "ks"
        "pull-all"
        "traverser"

        "pp-run"
        "config"
        "tmux-rename"
        "switch"
        "ding"
        "spawn-terminal"

        "ocr"
        "toggle-screen-recording"
        "wayblast"
      ];

      scripts = pkgs.stdenvNoCC.mkDerivation {
        pname = "personal-scripts";
        version = "0";
        src = ./bin;

        dontConfigure = true;
        dontBuild = true;

        installPhase = ''
          runHook preInstall

          for script in ${lib.escapeShellArgs scriptNames}; do
            install -Dm755 "$script" "$out/bin/$script"
          done

          runHook postInstall
        '';
      };
    in
    {
      home.packages = [ scripts ];
    };
}
