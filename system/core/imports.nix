{ config, lib, pkgs, ... }:

{
  imports = [
    ./services.nix
    ./persist.nix
    ./nix-settings.nix
    ./boot.nix
    ./zram.nix
    ./network.nix
    ./timelocale.nix
    ./security.nix
    ./virtualisation.nix
    ./users.nix
  ];
}
