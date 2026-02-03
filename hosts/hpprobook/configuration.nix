{ sources, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system/core
    ../../system/packages
    "${sources.preservation.src}/module.nix"
    "${sources.sops-nix.src}/modules/sops"
    (import sources.hjem.src {}).nixosModules.default
  ];

  networking.hostName = "hpprobook";

  system.stateVersion = "26.05";

  hjem = {
    clobberByDefault = true;
    specialArgs = { inherit sources; };
  };

  nix.nixPath = [
    "hjem=${sources.hjem.src}"
    "sops-nix=${sources.sops-nix.src}"
    "preservation=${sources.preservation.src}"
    "quickshell=${sources.quickshell.src}"
  ];

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [];
  };
}
