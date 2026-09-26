{
  flake.modules.homeManager.caligula =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.caligula ];
    };
}
