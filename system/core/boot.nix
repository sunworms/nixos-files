{pkgs, ...}: {
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    zswap = {
      enable = true;
      maxPoolPercent = 40;
    };
    initrd.systemd = {
      enable = true;
      services.rollback = {
        description = "Rollback BTRFS root subvolume to a pristine state";
        wantedBy = ["initrd.target"];

        after = ["initrd-root-device.target"];

        before = ["sysroot.mount"];

        unitConfig.DefaultDependencies = "no";
        serviceConfig.Type = "oneshot";
        script = ''
          mkdir -p /mnt

          mount /dev/disk/by-label/root /mnt

          btrfs subvolume list -o /mnt/@root |
            cut -f9 -d' ' |
            while read subvolume; do
              echo "deleting /$subvolume subvolume..."
              btrfs subvolume delete "/mnt/$subvolume"
            done &&
            echo "deleting /@root subvolume..." &&
            btrfs subvolume delete /mnt/@root
          echo "restoring blank /@root subvolume..."
          btrfs subvolume snapshot /mnt/@root-blank /mnt/@root

          umount /mnt
        '';
      };
    };
  };
}
