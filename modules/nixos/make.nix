{
  flake.modules.nixos.make =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        gnumake
      ];
    };
}
