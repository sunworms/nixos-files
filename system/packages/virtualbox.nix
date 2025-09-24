{ config, lib, pkgs, ... }:

{
  /*
    boot.extraModulePackages = with config.boot.kernelPackages; [
    virtualbox
  ];

  boot.kernelModules = [
    "vboxdrv"
    "vboxnetflt"
    "vboxnetadp"
  ];
  */
  virtualisation.virtualbox.host = {
    enable = true;
    enableKvm = true;
    addNetworkInterface = false;
    enableHardening = false;
  };
  users.extraGroups.vboxusers.members = [ "sunny" ];
}
