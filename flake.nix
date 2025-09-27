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
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nixcord.url = "github:kaylorben/nixcord";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    niri,
    spicetify-nix,
    nixcord,
    ... }@inputs: {
      nixosConfigurations = {
        hpprobook-nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/hpprobook/configuration.nix
            niri.nixosModules.niri
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.sunny = {
                  imports = [
                    ./home/home.nix
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
  };
}
