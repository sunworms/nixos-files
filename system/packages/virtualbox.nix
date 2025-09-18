{ config, lib, pkgs, ... }:

{
  virtualisation.virtualbox.host = {
    enable = true;
    enableKvm = true;
    addNetworkInterface = false;
    package = pkgs.virtualboxKvm;
  };
  users.extraGroups.vboxusers.members = [ "sunny" ];
  boot.kernelModules = [ "vboxdrv" "vboxnetflt" "vboxnetadp" ];
}
