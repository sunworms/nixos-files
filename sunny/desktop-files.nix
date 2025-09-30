{ config, lib, pkgs, ... }:

{
  file.home = {
    ".local/share/applications/spotify-web.desktop".text = ''
    [Desktop Entry]
    Name=Spotify Web
    GenericName=Music Streaming
    Comment=Open Spotify in Firefox (Web)
    Exec=firefox --new-window --kiosk https://open.spotify.com
    Terminal=false
    Type=Application
    Icon=firefox
    Categories=Audio;Music;Player;AudioVideo;
    StartupWMClass=Firefox
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
