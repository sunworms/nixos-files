{
  description = "A normal NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    preservation.url = "github:nix-community/preservation";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser-flake = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "";
    };
    mango = {
      url = "github:DreamMaoMao/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    yazi-gvfs = {
      url = "github:boydaihungst/gvfs.yazi";
      flake = false;
    };
  };

  outputs = { ... }@inputs: {
    nixosConfigurations = {
      hpprobook = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/hpprobook/configuration.nix
          inputs.sops-nix.nixosModules.sops
          inputs.preservation.nixosModules.preservation
          inputs.mango.nixosModules.mango
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
