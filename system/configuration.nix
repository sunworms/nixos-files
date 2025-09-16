{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./core/users.nix
      ./packages/programs.nix
    ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11";

}

