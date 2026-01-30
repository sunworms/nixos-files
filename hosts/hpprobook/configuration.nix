{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system/core
    ../../system/packages
  ];

  networking.hostName = "hpprobook";

  system.stateVersion = "26.05";
}
