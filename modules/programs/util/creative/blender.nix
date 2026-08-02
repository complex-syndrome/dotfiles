{
  flake.modules.homeManager.blender =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.blender ];
    };
}
