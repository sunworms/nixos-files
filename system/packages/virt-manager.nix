{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    qemu
  ];
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "sunny" ];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
