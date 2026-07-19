{
  flake.modules.homeManager.qview =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        qview
      ];
    };
}
