{ config, lib, ... }:

let
  sources = import ../../npins;
  pkgs = import sources.nixpkgs {
    system = "x86_64-linux";
  };
  niri-flake = builtins.getFlake "github:sodiboo/niri-flake?rev=d425163158a96a26924597574316a627d2e982aa";
  spicetify-nix = import (builtins.fetchTarball {
    url = "https://github.com/Gerg-L/spicetify-nix/archive/refs/heads/master.tar.gz";
    sha256 = "0bjfa29arya584zq50w8h5jihz3gdl4aawyjpln83d38syjjy2kx";
  }) { inherit pkgs; };
in
{
  imports =
    [
      (import sources.nix-maid).nixosModules.default
      spicetify-nix.nixosModules.spicetify
      ./hardware-configuration.nix
      ../../system/core/imports.nix
      ../../system/packages/imports.nix
    ];

  nixpkgs.overlays = [ niri-flake.overlays.niri ];

  networking.hostName = "hpprobook-nixos";

  system.stateVersion = "25.11";

}

