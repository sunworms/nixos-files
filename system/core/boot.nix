{pkgs, ...}: {
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_testing;
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

        path = with pkgs; [btrfs-progs coreutils gnused util-linux];

        serviceConfig = {
          Type = "oneshot";
        };

        script = ''
          mkdir -p /mnt
          mount -o subvolid=5 /dev/disk/by-label/root /mnt

          delete_subvolume_recursively() {
            local subvol="$1"
            local nested
            while IFS= read -r nested; do
              [ -n "$nested" ] && delete_subvolume_recursively "/mnt/$nested"
            done < <(btrfs subvolume list -o "$subvol" | sed -n 's/.*path //p')

            echo "Deleting subvolume $subvol..."
            btrfs subvolume delete "$subvol"
          }

          if [ -e /mnt/@root ]; then
            delete_subvolume_recursively /mnt/@root
          fi

          echo "Restoring blank /@root subvolume..."
          btrfs subvolume snapshot /mnt/@root-blank /mnt/@root

          umount /mnt
        '';
      };
    };
  };
}
