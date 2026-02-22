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

      ".cache/swww"
      ".cache/nix"

      ".config/helix"
      ".config/net.imput.helium"
      ".config/lazygit"
      ".config/fish"
      ".config/matugen"
      ".config/niri"
      ".config/waybar"
      ".config/foot"
      ".config/fuzzel"
      ".config/mako"
      ".config/zathura"
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
      ".local/share/Steam"
      ".local/share/fish"
      ".local/share/azahar-emu"
      ".local/share/eden"
      ".local/share/warp"
      ".local/share/SameBoy"
      ".local/share/osu"
      ".local/share/containers"
      ".local/share/keyrings"

      ".local/state/wireplumber"
    ];
    files = [ ];
  };
}
