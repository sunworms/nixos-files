{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      ../../system/core/users.nix
      ../../system/packages/programs.nix
    ];

  networking.hostName = "hpprobook-nixos";

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11";

}

