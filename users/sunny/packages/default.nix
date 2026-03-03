{ pkgs, ... }:

{
  packages = with pkgs; [
    (callPackage ./eden.nix { })
    pcsx2
    ppsspp-sdl-wayland
    melonds
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
    zathura
    vesktop
  ];
}
