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

      ".cache/nix"

      ".config/net.imput.helium/Default"
      ".config/rclone"
      ".config/fish"

      ".config/azahar-emu"
      ".config/eden"
      ".config/melonDS"
      ".config/mgba"
      ".config/PCSX2"
      ".config/ppsspp"
      ".config/qBittorrent"

      ".local/share/Steam"
      ".local/share/zathura"
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
    ];
    files = [
      {
        file = ".config/net.imput.helium/First Run";
        how = "symlink";
      }
    ];
  };
}
