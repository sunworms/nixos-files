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

      ".cache/awww"
      ".cache/nix"
      ".cache/typst"

      ".config/net.imput.helium"
      ".config/vesktop"
      ".config/fish"

      ".config/btop"
      ".config/fuzzel"
      ".config/gtk-3.0"
      ".config/gtk-4.0"
      ".config/helix"
      ".config/kitty"
      ".config/mako"
      ".config/niri"
      ".config/qt5ct"
      ".config/qt6ct"
      ".config/waybar"

      ".config/azahar-emu"
      ".config/eden"
      ".config/melonDS"
      ".config/mgba"
      ".config/PCSX2"
      ".config/ppsspp"

      ".local/share/color-schemes"
      ".local/share/okular"
      ".local/share/fish"
      ".local/share/azahar-emu"
      ".local/share/eden"
      ".local/share/SameBoy"
      ".local/share/keyrings"
      ".local/share/warp"
      ".local/share/containers"

      ".local/state/wireplumber"
      ".local/state/lazygit"
    ];
    files = [ ];
  };
}
