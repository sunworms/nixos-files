{...}: {
  imports = [
    ../../users/sunny/preserve.nix
  ];
  preservation = {
    enable = true;
    preserveAt."/persist" = {
      commonMountOptions = [
        "x-gvfs-hide"
        "x-gdu.hide"
      ];
      directories = [
        "/var/log"
        "/var/lib/bluetooth"
        "/var/lib/cloudflare-warp"
        "/var/lib/nixos"
        "/var/lib/systemd"
        "/var/lib/libvirt"
        "/var/lib/sops-nix"
        "/var/lib/containers"
        {
          directory = "/var/cache/tuigreet";
          user = "greeter";
          group = "greeter";
        }
        "/etc/NetworkManager/system-connections"
      ];
      files = [
        {
          file = "/etc/machine-id";
          how = "symlink";
          inInitrd = true;
        }
        {
          file = "/etc/ly/save.txt";
          how = "symlink";
        }
      ];
    };
  };
}
