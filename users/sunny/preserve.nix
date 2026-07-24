{...}: {
  preservation.preserveAt."/persist".users.sunny = {
    commonMountOptions = [
      "x-gvfs-hide"
      "x-gdu.hide"
    ];
    directories = [
      "devShells"
      "Documents"
      "Downloads"
      "Games"
      "Music"
      "nixos-files"
      "Pictures"
      "Videos"
      "VMs"

      ".ssh"
      ".var/app"

      ".cache/awww"
      ".cache/nix"
      ".cache/typst"

      ".config/btop"
      ".config/foot"
      ".config/fuzzel"
      ".config/niri"
      ".config/matugen"
      ".config/swaync"
      ".config/waybar"

      ".config/zen"
      ".config/vesktop"
      ".config/rclone"
      ".config/fish"

      ".config/gtk-3.0"
      ".config/gtk-4.0"

      ".config/azahar-emu"
      ".config/eden"
      ".config/melonDS"
      ".config/mgba"
      ".config/PCSX2"
      ".config/ppsspp"
      ".config/qBittorrent"

      ".local/share/flatpak"
      ".local/share/gvfs-metadata"
      ".local/share/fish"
      ".local/share/azahar-emu"
      ".local/share/eden"
      ".local/share/SameBoy"
      ".local/share/keyrings"
      ".local/share/warp"
      ".local/share/containers"

      ".local/state/wireplumber"
    ];
    files = [];
  };
}
