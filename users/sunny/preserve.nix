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

      ".cache/wal"
      ".cache/nix"
      ".cache/typst"
      ".cache/noctalia"

      ".config/mozilla"
      ".config/discord"
      ".config/Vencord"

      ".config/noctalia"
      ".config/fish"
      ".config/niri"
      ".config/alacritty"
      ".config/git"

      ".config/gtk-3.0"
      ".config/gtk-4.0"

      ".config/azahar-emu"
      ".config/eden"
      ".config/melonDS"
      ".config/mgba"
      ".config/PCSX2"
      ".config/ppsspp"

      ".local/share/zathura"
      ".local/share/fish"
      ".local/share/azahar-emu"
      ".local/share/eden"
      ".local/share/SameBoy"
      ".local/share/osu"
      ".local/share/containers"
      ".local/share/keyrings"
      ".local/share/warp"

      ".local/state/wireplumber"
    ];
    files = [ ];
  };
}
