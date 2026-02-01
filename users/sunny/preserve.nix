{ ... }:

{
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
      ".zen"
      ".steam"

      ".cache/swww"

      ".config/sops"
      ".config/fish"
      ".config/azahar-emu"
      ".config/eden"
      ".config/melonDS"
      ".config/mgba"
      ".config/PCSX2"
      ".config/ppsspp"

      ".local/share/Steam"
      ".local/share/fish"
      ".local/share/azahar-emu"
      ".local/share/eden"
      ".local/share/warp"
      ".local/share/SameBoy"
      ".local/share/osu"
      ".local/share/containers"
      ".local/share/keyrings"
      ".local/share/zathura"

      ".local/state/wireplumber"
    ];
    files = [
    ];
  };
}
