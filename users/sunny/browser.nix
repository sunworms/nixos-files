{pkgs, ...}: {
  packages = [
    (pkgs.callPackage ./helium.nix {})
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
      Exec=helium --app=https://discord.com/channels/@me
      Icon=${
        (pkgs.fetchurl {
          url = "https://upload.wikimedia.org/wikipedia/fr/4/4f/Discord_Logo_sans_texte.svg";
          hash = "sha256-fyh2K4xqb/xx1G9CocFagRLLtSu/x7jze5wITjEiTvk=";
        })
      }
      Categories=Network;InstantMessaging;
      Terminal=false
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
    '';
  };
}
