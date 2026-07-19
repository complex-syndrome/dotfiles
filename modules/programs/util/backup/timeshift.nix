{
  flake.modules.homeManager.timeshift =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        timeshift
      ];
    };
}
