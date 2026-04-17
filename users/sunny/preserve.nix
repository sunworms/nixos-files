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

      ".cache/nix"
      ".cache/typst"
      ".cache/DankMaterialShell"
      ".cache/distrobox"

      ".config/net.imput.helium"
      ".config/vesktop"

      ".config/DankMaterialShell"
      ".config/fish"
      ".config/niri"
      ".config/kitty"
      ".config/git"
      ".config/helix"

      ".config/gtk-3.0"
      ".config/gtk-4.0"

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
      ".local/share/osu"
      ".local/share/keyrings"
      ".local/share/warp"
      ".local/share/containers"

      ".local/state/wireplumber"
      ".local/state/DankMaterialShell"
    ];
    files = [ ];
  };
}
