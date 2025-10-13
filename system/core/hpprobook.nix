{ ... }:

{
  imports = [
    ./sops.nix
    ./persist.nix
    ./compress.nix
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
