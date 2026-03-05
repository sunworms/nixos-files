{ pkgs, ... }:

{
  #virtualisation.libvirtd = {
  #  enable = false;
  #  qemu = {
  #    package = pkgs.qemu_kvm;
  #    runAsRoot = true;
  #    swtpm.enable = true;
  #  };
  #};
  #programs.virt-manager.enable = false;

  #users.users.sunny.extraGroups = [ "libvirtd" ];

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  environment.systemPackages = with pkgs; [
    distrobox
    #virtiofsd
  ];
}
