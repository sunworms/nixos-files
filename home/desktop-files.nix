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

    PCSX2 = {
      terminal = false;
      type = "Application";
      name = "PCSX2";
      genericName = "PlayStation 2 Emulator";
      comment = "Sony PlayStation 2 emulator";
      exec = "pcsx2";
      icon = "PCSX2";
      categories = [ "Game" "Emulator" ];
    };
  };
}
