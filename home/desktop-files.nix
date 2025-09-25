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
  };
}
