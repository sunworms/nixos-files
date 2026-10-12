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
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    zathura
    typst
    tinymist
    typstyle
    websocat
    (import inputs.nix-index-database {inherit pkgs;}).comma-with-db
    (import inputs.nix-index-database {inherit pkgs;}).nix-index-with-small-db
    (writeShellApplication {
      name = "update-eden";

      runtimeInputs = with pkgs; [
        curl
        gnugrep
        gnused
        gawk
        coreutils
        nix
      ];

      text = ''
        set -euo pipefail

        pins="''${TACK_DIR:-.tack}/pins.toml"

        if [[ ! -f "$pins" ]]; then
          echo "update-eden: $pins not found; run this from your config repository root." >&2
          exit 1
        fi

        release_json="$(curl -fsSL --retry 2 \
          https://nightly.eden-emu.dev/latest/release.json)"

        if ! tag="$(printf '%s\n' "$release_json" \
          | grep -oE 'v[0-9]+\.[0-9a-f]+' \
          | sed -n '1p')" || [[ -z "$tag" ]]; then
          echo "update-eden: could not extract Eden's release tag." >&2
          exit 1
        fi

        version="''${tag#v}"
        hash="''${version#*.}"
        url="https://nightly.eden-emu.dev/$tag/Eden-Linux-$hash-amd64-gcc-standard.AppImage"

        tmp="$(mktemp "''${pins}.XXXXXX")"
        trap 'rm -f "$tmp"' EXIT

        if ! awk -v url="$url" '
          BEGIN { in_eden = 0; replaced = 0 }

          /^[[:space:]]*\[inputs\.eden\][[:space:]]*$/ {
            in_eden = 1
            print
            next
          }

          /^[[:space:]]*\[/ { in_eden = 0 }

          in_eden && /^[[:space:]]*url[[:space:]]*=/ {
            printf "url = \"%s\"\n", url
            replaced = 1
            next
          }

          { print }

          END { if (!replaced) exit 1 }
        ' "$pins" > "$tmp"; then
          echo "update-eden: couldn't find url in [inputs.eden]." >&2
          exit 1
        fi

        chmod --reference="$pins" "$tmp"
        mv "$tmp" "$pins"
        trap - EXIT

        if command -v tack >/dev/null 2>&1; then
          tack update eden --accept
        else
          nix --extra-experimental-features 'nix-command flakes' \
            run github:manic-systems/tack -- update eden --accept
        fi
      '';
    })
  ];
}
