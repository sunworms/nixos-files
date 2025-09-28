{ config, lib, pkgs, ... }:

{
  files = {
    ".config/mako/config".text = ''
    background-color=#212121
    border-color=#383838
    border-size=1
    default-timeout=10000
    font=D2CodingLigatureNerdFont 11
    progress-color=over #454545
    text-color=#d8d8d8

    [urgency=high]
    border-color=#b7141e
    '';

    ".config/xdg-desktop-portal/portals.conf".text = ''
    [preferred]
    default=gnome;gtk
    org.freedesktop.impl.portal.FileChooser=gtk
    org.freedesktop.impl.portal.Secret=gnome-keyring
    '';
  };
}
