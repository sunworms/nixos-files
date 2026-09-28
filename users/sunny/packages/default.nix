{
  pkgs,
  assets,
  inputs,
  osConfig,
  lib,
  ...
}: let
  extraCompatPackages = [pkgs.proton-ge-bin];
  extraCompatPaths = lib.makeSearchPathOutput "steamcompattool" "" extraCompatPackages;

  extraPkgsList = with pkgs; [
    volantes-cursors
    gamescope
    libGLU
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  sunnySteam = pkgs.steam.override {
    extraEnv = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = extraCompatPaths;
    };
    extraLibraries = p:
      with osConfig.hardware.graphics;
        if p.stdenv.hostPlatform.is64bit
        then [package] ++ extraPackages
        else [package32] ++ extraPackages32;
    extraPkgs = p: extraPkgsList;
  };

  sunnyProtontricks = pkgs.protontricks.override {inherit extraCompatPaths;};
in {
  imports = [
    ./services.nix
  ];

  packages = with pkgs; [
    sunnySteam
    sunnySteam.run
    sunnyProtontricks
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
    zathura
    (import inputs.nix-index-database.src {inherit pkgs;}).comma-with-db
    (import inputs.nix-index-database.src {inherit pkgs;}).nix-index-with-small-db
    typst
    tinymist
    typstyle
    websocat
  ];
}
