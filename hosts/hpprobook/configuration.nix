{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system/core/hpprobook.nix
    ../../system/packages/hpprobook.nix
  ];

  networking.hostName = "hpprobook";

  system.stateVersion = "25.11";
}
