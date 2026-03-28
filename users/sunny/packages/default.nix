{ pkgs, ... }:

{
  packages = with pkgs; [
    (runCommand "wine-symlink" { } ''
      mkdir -p $out/bin
      ln -sf ${wineWow64Packages.stagingFull}/bin/wine $out/bin/wine64
    '')
    wineWow64Packages.stagingFull
    winetricks
    (callPackage ./eden.nix { })
    (callPackage ./pcsx2.nix { })
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
    (discord.override {
      withVencord = true;
      withOpenASAR = true;
    })
    kdePackages.okular
  ];
}
