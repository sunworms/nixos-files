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
        "/etc/NetworkManager/system-connections"
        {
          directory = "/var/cache/tuigreet";
          user = "greeter";
          group = "greeter";
        }
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
