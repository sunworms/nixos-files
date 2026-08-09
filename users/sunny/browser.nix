{
  pkgs,
  inputs,
  assets,
  ...
}: {
  packages = [
    (pkgs.callPackage ./helium.nix {inherit inputs;})
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
      Icon=${assets}/discord.png
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
      Icon=${assets}/sable.png
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
      Icon=${assets}/spotify.png
      Categories=Audio;Music;Player;AudioVideo;
      Terminal=false
      StartupWMClass=chrome-open.spotify.com__-Default
    '';
  };
}
