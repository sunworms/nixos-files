{
  pkgs,
  sources,
  ...
}: {
  packages = [
    (pkgs.callPackage ./helium.nix {inherit sources;})
  ];

  xdg.config.files = {
    "net.imput.helium/WidevineCdm/latest-component-updated-widevine-cdm".text = ''
      {"Path":"${pkgs.widevine-cdm}/share/google/chrome/WidevineCdm"}
    '';
  };

  xdg.data.files = {
    "applications/discord.desktop".text = ''
      [Desktop Entry]
      Version=1.0
      Type=Application
      Name=Discord
      Comment=Chat, talk, and hang out
      Exec=helium --app=https://discord.com/app
      Icon=${
        (pkgs.fetchurl {
          url = "https://www.svgrepo.com/show/331368/discord-v2.svg";
          hash = "sha256-ETdzE1AiggK2AKkQjAPII0/CIbF6MowF9zEA8fg8LDY=";
        })
      }
      Categories=Network;InstantMessaging;
      Terminal=false
      StartupWMClass=chrome-discord.com__app-Default
    '';
    "applications/sable.desktop".text = ''
      [Desktop Entry]
      Version=1.0
      Type=Application
      Name=Sable
      Comment=Almost Stable Matrix Client
      Exec=helium --app=https://dev.sable.moe
      Icon=${
        (pkgs.fetchurl {
          url = "https://avatars.githubusercontent.com/u/266766652";
          hash = "sha256-BeBCkapIxAcz2UowLhUyTbomccc9yER5T/HCjSxcem4=";
        })
      }
      Categories=Network;InstantMessaging;
      Terminal=false
      StartupWMClass=chrome-dev.sable.moe__-Default
    '';
    "applications/spotify.desktop".text = ''
      [Desktop Entry]
      Version=1.0
      Type=Application
      Name=Spotify
      Comment=Music streaming service
      Exec=helium --app=https://open.spotify.com
      Icon=${
        (pkgs.fetchurl {
          url = "https://upload.wikimedia.org/wikipedia/commons/1/19/Spotify_logo_without_text.svg";
          hash = "sha256-cphMjj/3K8ydH2iezzLqTadLdLJ8vxNB+PNt5oaz67s=";
        })
      }
      Categories=Audio;Music;Player;AudioVideo;
      Terminal=false
      StartupWMClass=chrome-open.spotify.com__-Default
    '';
  };
}
