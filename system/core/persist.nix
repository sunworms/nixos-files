{ config, lib, pkgs, ... }:

{
  environment.persistence."/persist" = {
    enable = true;
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd"
      "/home/sunny"
    ];
    files = [
      "/etc/machine-id"
    ];
  };
}
