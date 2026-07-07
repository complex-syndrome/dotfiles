{
  flake.modules.nixos.kvm-qemu =
    { pkgs, ... }:
    {
      virtualisation.libvirtd = {
        enable = true;
        qemu = {
          package = pkgs.qemu_kvm;
          runAsRoot = true;
          swtpm.enable = true; # Necessary for TPM 2.0 simulation if installing Windows 11
        };
      };

      programs.virt-manager.enable = true;

      virtualisation.libvirtd.qemu.vhostUserPackages = with pkgs; [
        virtiofsd
      ];
      services.spice-vdagentd.enable = true;

      users.users.nixos.extraGroups = [ "libvirtd" ];

      networking.firewall.trustedInterfaces = [ "virbr0" ];
    };
}
