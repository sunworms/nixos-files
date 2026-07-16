{ pkgs, ... }:

{
  imports = [
    ./services.nix
  ];

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
    (
      (vesktop.override {
        electron_40 = pkgs.electron_42;
      }).overrideAttrs
      (oldAttrs: {
        electron = electron_42;
        preBuild = ''
          # Validate electron version matches upstream package.json
          expectedMajor="$(jq -r '.devDependencies.electron | ltrimstr("^") | split(".") | .[0]' < package.json)"
          actualMajor="${lib.versions.major electron.version}"
          if [ "$actualMajor" -lt "$expectedMajor" ] 2>/dev/null; then
            echo "ERROR: nixpkgs electron version (major $actualMajor) is older than upstream package.json requirement (major $expectedMajor)"
            exit 1
          fi

          # electron builds must be writable
          cp -r ${electron.dist} electron-dist
          chmod -R u+w electron-dist
        '';
      })
    )
  ];
}
