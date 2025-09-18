{ config, lib, pkgs, ... }:

{
  xdg.desktopEntries = {
    discord = {
      categories = [ "Network" "InstantMessaging" ];
      exec = "discord --ozone-platform-hint=auto";
      genericName = "All-in-one cross-platform voice and text chat for gamers";
      icon = "discord";
      mimeType = [ "x-scheme-handler/discord" ];
      name = "Discord";
      type = "Application";
    };

    spotify = {
      type = "Application";
      name = "Spotify";
      genericName = "Music Player";
      icon = "spotify-client";
      exec = "spotify %U --ozone-platform-hint=auto";
      terminal = false;
      mimeType = [ "x-scheme-handler/spotify" ];
      categories = [ "Audio" "Music" "Player" "AudioVideo" ];
    };

    vmware-workstation = {
      name = "VMware Workstation";
      comment = "Run and manage virtual machines";
      exec = "env GDK_BACKEND=x11vmware %U";
      terminal = false;
      type = "Application";
      icon = "vmware-workstation";
      categories = [ "System" ];
      mimeType = [ "application/x-vmware-vm" "application/x-vmware-team" "application/x-vmware-enc-vm" "x-scheme-handler/vmrc" ];
    };
  };
}
