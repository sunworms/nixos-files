{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../system/core/imports.nix
      ../../system/packages/programs.nix
    ];

  networking.hostName = "hpprobook-nixos";

  system.stateVersion = "25.11";

}

