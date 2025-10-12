{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../default.nix
    ../../system/core/hpprobook.nix
    ../../system/packages/hpprobook.nix
  ];

  networking.hostName = "hpprobook";

  system.stateVersion = "25.11";
}
