{ pkgs, sources, ... }:

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
    linker = (pkgs.callPackage "${sources.smfh.src}/package.nix" { });
    specialArgs = { inherit sources; };
  };

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [ ];
  };
}
