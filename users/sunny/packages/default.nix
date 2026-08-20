{
  pkgs,
  inputs,
  assets,
  ...
}: {
  imports = [
    ./services.nix
  ];

  packages = with pkgs; [
    (callPackage ./eden.nix {inherit inputs assets;})
    (callPackage ./pcsx2.nix {inherit inputs assets;})
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
    (import inputs.nix-index-database.src {inherit pkgs;}).comma-with-db
  ];
}
