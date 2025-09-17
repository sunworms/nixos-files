{ config, lib, pkgs, ... }:

{
  security.polkit.enable = true;
  systemd.user.services.niri-flake-polkit.enable = false;
}
