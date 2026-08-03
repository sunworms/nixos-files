{...}: let
  symlinks = paths:
    map (file: {
      inherit file;
      how = "symlink";
    })
    paths;
in {
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

      ".config/rclone"
      ".config/fish"

      ".config/azahar-emu"
      ".config/eden"
      ".config/melonDS"
      ".config/mgba"
      ".config/PCSX2"
      ".config/ppsspp"
      ".config/qBittorrent"

      ".local/share/zathura"
      ".local/share/fish"
      ".local/share/nvfetcher"
      ".local/share/azahar-emu"
      ".local/share/eden"
      ".local/share/SameBoy"
      ".local/share/keyrings"
      ".local/share/containers"
      ".local/share/warp"

      ".local/state/wireplumber"
      ".local/state/noctalia"

      # helium
      ".config/net.imput.helium/Default/Extensions"
      ".config/net.imput.helium/Default/Local Extension Settings"
      ".config/net.imput.helium/Default/Extension State"
      ".config/net.imput.helium/Default/Sync Data"
      ".config/net.imput.helium/Default/Local Storage"
      ".config/net.imput.helium/Default/WebStorage"
      ".config/net.imput.helium/Default/IndexedDB"
      ".config/net.imput.helium/Default/Service Worker"
      ".config/net.imput.helium/Default/Session Storage"
      ".config/net.imput.helium/Default/Managed Extension Settings"
    ];
    files = symlinks [
      # helium
      ".config/net.imput.helium/First Run"
      ".config/net.imput.helium/Local State"
      ".config/net.imput.helium/Default/Preferences"
      ".config/net.imput.helium/Default/Secure Preferences"
      ".config/net.imput.helium/Default/Cookies"
      ".config/net.imput.helium/Default/History"
    ];
  };
}
