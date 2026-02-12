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
      ".steam"

      ".cache/DankMaterialShell"

      ".config/net.imput.helium"
      # ".config/glide"
      ".config/koreader"
      ".config/fish"
      ".config/niri"
      ".config/DankMaterialShell"
      ".config/foot"
      ".config/git"

      ".config/gtk-3.0"
      ".config/gtk-4.0"

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
      ".local/share/matrix-commander-rs"

      ".local/state/DankMaterialShell"
      ".local/state/wireplumber"
    ];
    files = [
    ];
  };
}
