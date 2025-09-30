{ config, lib, ... }:

let
  sources = import ../../npins;
  pkgs = import sources.nixpkgs {
    system = "x86_64-linux";
  };
  flake-compat = import sources.flake-compat;
  spicetify-nix = flake-compat { src = sources.spicetify-nix; };
  niri-flake = flake-compat { src = sources.niri-flake; };
in
{
  imports =
    [
      (import sources.nix-maid).nixosModules.default
      spicetify-nix.defaultNix.nixosModules.spicetify
      niri-flake.defaultNix.nixosModules.niri
      ./hardware-configuration.nix
      ../../system/core/imports.nix
      ../../system/packages/imports.nix
    ];

  networking.hostName = "hpprobook-nixos";

  system.stateVersion = "25.11";

}

