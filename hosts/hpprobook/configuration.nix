{ sources, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system/core
    ../../system/packages
  ];

  networking.hostName = "hpprobook";

  system.stateVersion = "26.05";

  hjem = {
    clobberByDefault = true;
    specialArgs = { inherit sources; };
  };

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [ ];
  };
}
