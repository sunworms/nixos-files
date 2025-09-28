{ config, lib, pkgs, ... }:

{
  files = {
    ".local/share/applications/discord.desktop".text = ''
    [Desktop Entry]
    Categories=Network;InstantMessaging
    Exec=discord --ozone-platform-hint=auto
    GenericName=All-in-one cross-platform voice and text chat for gamers
    Icon=discord
    MimeType=x-scheme-handler/discord
    Name=Discord
    Terminal=false
    Type=Application
    '';

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
