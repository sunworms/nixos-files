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
    set -e

    # Files to update
    NIX_FILES="./hosts/hpprobook/configuration.nix ./system/packages/audio.nix"

    # repo-name and URL pairs
    REPOS_URLS="
    spicetify-nix https://github.com/Gerg-L/spicetify-nix/archive/refs/heads/master.tar.gz
    "

    echo "Updating hashes in $NIX_FILES..."

    for NIX_FILE in $NIX_FILES; do
        echo "Updating file: $NIX_FILE"

        echo "$REPOS_URLS" | while read repo_name url; do
            if [ -z "$repo_name" ]; then
                continue
            fi

            echo "Fetching latest tarball for $repo_name..."
            hash=$(nix-prefetch-url --unpack "$url" | tail -n 1)
            echo "New hash for $repo_name: $hash"

            # Replace hash in nix file matching comment # repo_name
            sed -i -E "s|(sha256 = \")[^\"]*(\"; # $repo_name)|\1$hash\2|" "$NIX_FILE"
        done
    done

    echo "Hashes updated successfully."
    '')

    (writeShellScriptBin "update-niri" ''
    NIX_FILE="./hosts/hpprobook/configuration.nix"

    # Get the latest revision from flake metadata
    NEW_REV=$(nix flake metadata github:sodiboo/niri-flake | awk '/^Revision:/ { print $2 }')

    if [ -z "$NEW_REV" ]; then
        echo "Error: failed to extract revision" >&2
        exit 1
    fi

    # Extract the current revision from the nix file
    OLD_REV=$(awk -F'rev=' '/sodiboo\/niri-flake/ { sub(/".*/, "", $2); print $2 }' "$NIX_FILE")

    if [ "$NEW_REV" = "$OLD_REV" ]; then
        echo "Already up to date (revision $NEW_REV)"
        exit 0
    fi

    echo "Updating niri-flake revision from $OLD_REV to $NEW_REV"

    # Replace the revision in the nix file
    sed -i.bak "s|\(github:sodiboo/niri-flake?rev=\)[a-f0-9]\+|\1$NEW_REV|g" "$NIX_FILE"

    echo "Updated $NIX_FILE (backup saved as $NIX_FILE.bak)"

    '')
  ];

  environment.pathsToLink = [ "/share/xdg-desktop-portal" "/share/applications" ];
}
