{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../system/core/imports.nix
      ../../system/packages/imports.nix
    ];

  networking.hostName = "hpprobook-nixos";

  system.stateVersion = "25.11";

}

