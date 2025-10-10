{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../common.nix
    ../../system/core/imports.nix
    ../../system/packages/imports.nix
  ];

  networking.hostName = "hpprobook";

  system.stateVersion = "25.11";
}
