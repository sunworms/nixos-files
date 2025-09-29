{ config, lib, pkgs, ... }:

{
  file.home = {
    ".local/share/applications/spotify.desktop".text = ''
    [Desktop Entry]
    Categories=Audio;Music;Player;AudioVideo
    Exec=spotify %U --ozone-platform-hint=auto
    GenericName=Music Player
    Icon=spotify-client
    MimeType=x-scheme-handler/spotify
    Name=Spotify
    Terminal=false
    Type=Application
    '';

    ".local/share/applications/pcsx2.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=PCSX2
    GenericName="PlayStation 2 emulator"
    Comment="PlayStation 2 emulator"
    TryExec=pcsx2
    Exec=pcsx2
    Icon=pcsx2
    Terminal=false
    StartupNotify=true
    StartupWMClass=pcsx2
    Categories=Game;Emulator;
    '';
  };
}
