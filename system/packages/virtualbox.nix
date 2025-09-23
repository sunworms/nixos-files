{ config, lib, pkgs, ... }:

{
  virtualisation.virtualbox.host = {
    enable = true;
    enableKvm = true;
    addNetworkInterface = false;
    enableHardening = false;
    enableExtensionPack = true;
  };
  users.extraGroups.vboxusers.members = [ "sunny" ];
}
