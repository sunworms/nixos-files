{ config, lib, pkgs, ... }:

{
  imports = [
    ./nix-settings.nix
    ./boot.nix
    ./zram-and-fs.nix
    ./network.nix
    ./timelocale.nix
    ./security.nix
    ./virtualisation.nix
    ./users.nix
  ];
}
