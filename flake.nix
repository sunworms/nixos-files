{
  description = "Sunny's NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nixcord.url = "github:kaylorben/nixcord";
  };

  outputs = { self, nixpkgs, home-manager, niri, catppuccin, spicetify-nix, nixcord, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./system/configuration.nix
        niri.nixosModules.niri
        catppuccin.nixosModules.catppuccin
        home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.sunny = {
                imports = [
                  ./home/home.nix
                  catppuccin.homeModules.catppuccin
                  spicetify-nix.homeManagerModules.spicetify
                  nixcord.homeModules.nixcord
                ];
              };
              extraSpecialArgs = { inherit inputs; };
            };
          }
      ];
    };
  };
}
