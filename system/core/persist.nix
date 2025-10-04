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
      { directory = "/home/sunny"; user = "sunny"; group = "users"; mode = "0755"; }
    ];
    files = [
      "/etc/machine-id"
    ];
  };
}
