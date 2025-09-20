{ config, lib, pkgs, ... }:

{
  virtualisation.virtualbox.host = {
    enable = true;
    enableKvm = true;
    addNetworkInterface = false;
    enableHardening = false;
  };
  users.extraGroups.vboxusers.members = [ "sunny" ];
  boot.kernelModules = [ "vboxdrv" "vboxnetflt" "vboxnetadp" ];
}
