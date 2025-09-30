{ config, lib, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;

  programs = {
    git.enable = true;
    dconf.enable = true;
  };

  services.gvfs = {
    enable = true;
    package = pkgs.gvfs;
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [ vpl-gpu-rt vaapiIntel intel-media-driver ];
  };

  environment.systemPackages = with pkgs; [
    nh
    npins
    libnotify
    fastfetch
    hyfetch
    brightnessctl
    wl-clipboard
    gnome-keyring

    (writeShellScriptBin "update-hashes" ''
    FILE="./hosts/hpprobook/configuration.nix"

    URL="https://github.com/Gerg-L/spicetify-nix/archive/refs/heads/master.tar.gz"

    # run nix-prefetch-url and get the last line (the hash)
    NEW_SHA=$(nix-prefetch-url --unpack "$URL" 2>/dev/null | tail -n1)

    if [ -z "$NEW_SHA" ]; then
        printf 'Error: could not fetch new sha256\n' >&2
        exit 1
    fi

    # replace the line in-place
    # works for sha256 = "..."; with any spacing
    sed -i "s#^\([[:space:]]*sha256[[:space:]]*=[[:space:]]*\"\)[^\"]*\"#\1$NEW_SHA\"#" "$FILE"

    printf 'Updated spicetify-nix sha256 to %s in %s\n' "$NEW_SHA" "$FILE"
    '')

    (writeShellScriptBin "update-niri" ''
    file="./hosts/hpprobook/configuration.nix"

    # Extract latest revision from flake metadata
    rev=$(nix flake metadata github:sodiboo/niri-flake --json \
        | grep '"revision":' \
        | sed -n 's/.*"revision": *"\([0-9a-f]\{40\}\)".*/\1/p')

    if [ -z "$rev" ]; then
        echo "Error: could not extract revision" >&2
        exit 1
    fi

    echo "Latest revision: $rev"
    echo "Updating $file …"

    # Replace the revision in the getFlake line
    sed -i "s|niri-flake = builtins.getFlake \"github:sodiboo/niri-flake?rev=[0-9a-f]\{40\}\";|niri-flake = builtins.getFlake \"github:sodiboo/niri-flake?rev=$rev\";|" "$file"

    echo "Done. $file now points to revision $rev"
    '')
  ];

  environment.pathsToLink = [ "/share/xdg-desktop-portal" "/share/applications" ];
}
