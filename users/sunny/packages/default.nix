{ pkgs, sources, ... }:

{
  packages = with pkgs; [
    (callPackage ./pcsx2.nix { inherit sources; })
    (callPackage ./eden.nix { inherit sources; })
    ppsspp-sdl-wayland
    melonDS
    azahar
    mgba
    sameboy
    osu-lazer-bin
    p7zip-rar
    xdg-user-dirs
    jq
    (mpv.override {
      scripts = [
        mpvScripts.mpris
      ];
    })
    satty
    koreader
    vesktop
  ];
}
