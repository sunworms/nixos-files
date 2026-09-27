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
      "Projects"
      "Videos"
      "VMs"

      ".ssh"

      ".cache/cliphist"
      ".cache/awww"
      ".cache/nix"

      ".config/btop"
      ".config/kitty"
      ".config/fuzzel"
      ".config/mako"
      ".config/niri"
      ".config/matugen"
      ".config/waybar"
      ".config/gtk-3.0"
      ".config/gtk-4.0"
      ".config/qt5ct"
      ".config/qt6ct"
      ".config/zathura"

      ".config/net.imput.helium/Default"
      ".config/rclone"
      ".config/fish"
      ".config/copyq"

      ".config/azahar-emu"
      ".config/eden"
      ".config/melonDS"
      ".config/mgba"
      ".config/PCSX2"
      ".config/ppsspp"
      ".config/qBittorrent"

      ".local/share/copyq"
      ".local/share/color-schemes"
      ".local/share/Steam"
      ".local/share/gvfs-metadata"
      ".local/share/eden"
      ".local/share/fish"
      ".local/share/nvfetcher"
      ".local/share/azahar-emu"
      ".local/share/SameBoy"
      ".local/share/keyrings"
      ".local/share/containers"
      ".local/share/warp"

      ".local/state/wireplumber"
      ".local/state/noctalia"
      ".local/state/lazygit"
    ];
    files = [
      {
        file = ".config/net.imput.helium/First Run";
        how = "symlink";
      }
    ];
  };
}
