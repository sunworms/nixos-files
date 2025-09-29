{ config, lib, pkgs, ... }:

{
  files = {
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
  };
}
