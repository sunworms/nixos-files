{
  pkgs,
  sources,
  assets,
  inputs,
  ...
}: {
  imports = [
    ./services.nix
  ];

  packages = with pkgs; [
    (callPackage ./eden.nix {inherit sources assets;})
    (callPackage ./pcsx2.nix {inherit sources assets;})
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
    (import inputs.nix-index-database {inherit pkgs;}).comma-with-db
  ];
}
