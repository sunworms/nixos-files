{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence.url = "github:nix-community/impermanence";
    nur = {
      url = "github:nix-community/nur";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mangowc = {
      url = "github:DreamMaoMao/mangowc";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:KaylorBen/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      impermanence,
      nur,
      stylix,
      mangowc,
      niri-flake,
      nixcord,
      sops-nix,
      spicetify-nix,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        hpprobook = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/hpprobook/configuration.nix
            niri-flake.nixosModules.niri
            impermanence.nixosModules.impermanence
            home-manager.nixosModules.home-manager
            stylix.nixosModules.stylix
            sops-nix.nixosModules.sops
            mangowc.nixosModules.mango
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.sunny = {
                imports = [
                  ./sunny/home.nix
                  spicetify-nix.homeManagerModules.spicetify
                  sops-nix.homeManagerModules.sops
                  mangowc.hmModules.mango
                  nixcord.homeModules.nixcord
                ];
              };
              home-manager.extraSpecialArgs = { inherit inputs; };
            }
          ];
        };
      };
    };
}
