{
  pkgs,
  lib,
  inputs,
  assets,
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
    (callPackage ./eden.nix {inherit inputs assets;})
    (callPackage ./pcsx2.nix {inherit inputs assets;})
    ppsspp-sdl-wayland
    melonds
    (azahar.overrideAttrs {
      version = "2126.0";
      src = fetchFromGitHub {
        owner = "azahar-emu";
        repo = "azahar";
        tag = "2126.0";
        postCheckout = ''
          git -C "$out/externals" submodule update --init \
            teakra zstd discord-rpc spirv-headers spirv-tools sirit xxHash \
            faad2/faad2 lodepng/lodepng dds-ktx nihstro "$out/dist/compatibility_list"
          echo "2126.0" > "$out/GIT-TAG"
          git -C "$out" rev-parse HEAD > "$out/GIT-COMMIT"
        '';
        hash = "sha256-/ON5YbwIHZmstjt3zAbw/uns9DVicjyJD3eDcY6JX24=";
      };
    })
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
