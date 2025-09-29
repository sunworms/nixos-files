{ config, lib, ... }:

let
  sources = import ../../npins;
  pkgs = import sources.nixpkgs {
    system = "x86_64-linux";
  };
in
{
  imports =
    [
      (import sources.nix-maid).nixosModules.default
      ./hardware-configuration.nix
      ../../system/core/imports.nix
      ../../system/packages/imports.nix
    ];

  networking.hostName = "hpprobook-nixos";

  system.stateVersion = "25.11";

}

