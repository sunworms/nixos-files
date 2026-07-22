{...}: {
  imports = [
    ./hardware-configuration.nix
    ../../system/core
    ../../system/packages
  ];

  networking.hostName = "motobook";

  system.stateVersion = "26.05";
}
