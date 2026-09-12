{
  pkgs,
  assets,
  inputs,
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
    rclone
    gpu-screen-recorder-gtk
    nautilus
    nautilus-python
    nautilus-open-any-terminal
    papers
    (import inputs.nix-index-database.src {inherit pkgs;}).comma-with-db
    (import inputs.nix-index-database.src {inherit pkgs;}).nix-index-with-small-db
  ];

  xdg.data.files."nautilus-python/extensions/nautilus_open_any_terminal.py" = {
    source = "${pkgs.nautilus-open-any-terminal}/share/nautilus-python/extensions/nautilus_open_any_terminal.py";
  };
}
