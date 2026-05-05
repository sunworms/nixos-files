{ ... }:

{
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
        "/var/lib/nixos"
        "/var/lib/systemd"
        "/var/lib/libvirt"
        "/var/lib/sops-nix"
        "/var/lib/containers"
        "/var/lib/cloudflare-warp"
        "/etc/ly"
        "/etc/NetworkManager/system-connections"
      ];
      files = [
        {
          file = "/etc/machine-id";
          how = "symlink";
          inInitrd = true;
        }
      ];
    };
  };
}
