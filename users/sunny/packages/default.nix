{
  pkgs,
  lib,
  sources,
  ...
}: {
  imports = [
    ./services.nix
  ];

  packages = with pkgs; [
    (runCommand "wine-symlink" {} ''
      mkdir -p $out/bin
      ln -sf ${lib.getExe' wineWow64Packages.unstableFull "wine"} $out/bin/wine64
    '')
    wineWow64Packages.unstableFull
    winetricks
    (callPackage ./eden.nix {inherit sources;})
    (callPackage ./pcsx2.nix {inherit sources;})
    ppsspp-sdl-wayland
    melonds
    azahar
    mgba
    sameboy
    p7zip-rar
    xdg-user-dirs
    jq
    (mpv.override {
      scripts = [
        mpvScripts.mpris
      ];
    })
    mpvpaper
    ffmpeg
    imagemagick
    yt-dlp
    satty
    qbittorrent
    zathura
    rclone
    gpu-screen-recorder-gtk
  ];
}
