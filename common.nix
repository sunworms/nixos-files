{ config, lib, ... }:

let
  sources = import ./npins;
  pkgs = import sources.nixpkgs {
    system = "x86_64-linux";
  };
  flake-compat = import sources.flake-compat;
  spicetify-nix = flake-compat { src = sources.spicetify-nix; };
  niri-flake = flake-compat { src = sources.niri-flake; };
  home-manager = flake-compat { src = sources.home-manager; };
  nixcord = flake-compat { src = sources.nixcord; };
  impermanence = flake-compat { src = sources.impermanence; };
in
{
  imports =
    [
      niri-flake.defaultNix.nixosModules.niri
      impermanence.defaultNix.nixosModules.impermanence
      home-manager.defaultNix.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.sunny = {
          imports = [
            ./sunny/home.nix
            spicetify-nix.defaultNix.homeManagerModules.spicetify
            nixcord.defaultNix.homeModules.nixcord
            impermanence.homeManagerModules.impermanence
          ];
        };
      }
    ];
}
