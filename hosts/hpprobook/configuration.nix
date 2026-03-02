{ sources, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system/core
    ../../system/packages
    "${sources.preservation.src}/module.nix"
    "${sources.sops-nix.src}/modules/sops"
    (import sources.hjem.src { }).nixosModules.default
  ];

  networking.hostName = "hpprobook";

  system.stateVersion = "26.05";

  hjem = {
    clobberByDefault = true;
    specialArgs = { inherit sources; };
  };

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      (import sources.emacs-overlay.src)
    ];
  };

  nix.nixPath = [
    "nixpkgs=${sources.nixpkgs.src}"
    "emacs-overlay=${sources.emacs-overlay.src}"
  ];

}
