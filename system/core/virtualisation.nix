{ pkgs, ... }:

{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      vhostUserPackages = with pkgs; [ virtiofsd ];
    };
  };
  programs.virt-manager.enable = true;

  users.users.sunny.extraGroups = [ "libvirtd" ];
}
