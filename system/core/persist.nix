{ ... }:

{
  environment.persistence."/persist" = {
    enable = true;
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd"
      "/var/lib/cloudflare-warp"
      {
        directory = "/var/lib/sops-nix";
        group = "users";
        mode = "u=rw,g=rw,o=";
      }
    ];
    files = [
      "/etc/machine-id"
    ];

    users.sunny = {
      directories = [
        "devShells"
        "nixos-files"
        "AUR"
        "Documents"
        "Games"
        "Music"
        "Pictures"
        "Videos"
        "VMs"

        ".mozilla/firefox/sunny"
        ".wine"
        ".ssh"

        ".config/vesktop"
        ".config/spotify"
        ".config/azahar-emu"
        ".config/PCSX2"
        ".config/melonDS"
        ".config/mgba"
        ".config/ppsspp"
        ".config/eden"

        ".local/share/eden"
        ".local/share/azahar-emu"
        ".local/share/fish"
        ".local/share/zed"
        ".local/share/warp"
        ".local/share/containers"
      ];
      files = [ ];
    };
  };
}
