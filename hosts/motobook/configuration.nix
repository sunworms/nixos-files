{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system/core
    ../../system/packages
  ];

  networking.hostName = "motobook";

  system.stateVersion = "26.05";

  hjem = {
    clobberByDefault = true;
    specialArgs = { inherit inputs; };
  };

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.niri.overlays.niri-nix
    ];
  };
}
