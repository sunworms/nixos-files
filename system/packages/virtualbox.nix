{ config, lib, pkgs, ... }:

{
  virtualisation.virtualbox.host = {
    enable = true;
    enableKvm = true;
    enableHardening = false;
    addNetworkInterface = false;
  };

  users.extraGroups.vboxusers.members = [ "sunny" ];
  boot.kernelModules = [ "vboxdrv" "vboxnetadp" "vboxnetflt" ];

}
