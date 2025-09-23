{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    qemu
  ];
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "sunny" ];
  virtualisation.libvirtd = {
    enable = true;
    qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
  };
  virtualisation.spiceUSBRedirection.enable = true;
}
