{ ... }:

let
  sources = import ./npins;
  flake-compat = import sources.flake-compat;
  spicetify-nix = flake-compat { src = sources.spicetify-nix; };
  niri-flake = flake-compat { src = sources.niri-flake; };
  home-manager = flake-compat { src = sources.home-manager; };
  impermanence = flake-compat { src = sources.impermanence; };
  nixcord = import sources.nixcord;
  stylix = import sources.stylix;
in
{
  imports = [
    niri-flake.defaultNix.nixosModules.niri
    impermanence.defaultNix.nixosModules.impermanence
    home-manager.defaultNix.nixosModules.home-manager
    stylix.nixosModules.stylix
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.sunny = {
        imports = [
          ./sunny/home.nix
          spicetify-nix.defaultNix.homeManagerModules.spicetify
          nixcord.homeModules.nixcord
        ];
      };
    }
  ];
}
