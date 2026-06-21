{
  flake.modules.nixos.sops =
    {
      pkgs,
      inputs,
      ...
    }:
    {
      environment.systemPackages = with pkgs; [
        sops
        age
      ];
    };
}
