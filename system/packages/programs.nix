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
    repo1 https://github.com/Gerg-L/spicetify-nix/archive/refs/heads/master.tar.gz
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
  ];

  environment.pathsToLink = [ "/share/xdg-desktop-portal" "/share/applications" ];
}
