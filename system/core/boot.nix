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
    zswap.enable = true;
    initrd.systemd.enable = false;
  };

  system.nixos-core.enable = true;
}
