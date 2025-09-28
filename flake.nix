{
  description = "Sunny's NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    hjem,
    niri,
    spicetify-nix,
    ... }@inputs: {
      nixosConfigurations = {
        hpprobook-nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/hpprobook/configuration.nix
            niri.nixosModules.niri
            hjem.nixosModules.default
            {
              hjem.users.sunny = ./sunny/hjem.nix;
              hjem.clobberByDefault = true;
              hjem.specialArgs = { inherit inputs; };
            }
            spicetify-nix.nixosModules.spicetify
        ];
      };
    };
  };
}
