{ sources, ... }:

let
  dms =
    (import sources.flake-compat.src {
      src = sources.dms.src;
      copySourceTreeToStore = false;
    }).defaultNix;
in
{
  imports = [
    ./hardware-configuration.nix
    ../../system/core
    ../../system/packages
    "${sources.preservation.src}/module.nix"
    "${sources.sops-nix.src}/modules/sops"
    dms.nixosModules.default
    "${sources.dms-plugin-registry.src}/nix/module.nix"
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
    overlays = [ ];
  };

  nix.nixPath = [
    "nixpkgs=${sources.nixpkgs.src}"
  ];
}
