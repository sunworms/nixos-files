{ pkgs, ... }:

{
  packages = with pkgs; [
    (callPackage ./pcsx2.nix { })
    (callPackage ./eden.nix { })
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
  ];
}
