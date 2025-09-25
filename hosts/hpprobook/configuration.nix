{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../system/core/users.nix
      ../../system/packages/programs.nix
    ];

  networking.hostName = "hpprobook-nixos";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11";

}

