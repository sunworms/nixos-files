{
  description = "A normal NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    preservation.url = "github:nix-community/preservation";
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-darwin.follows = "";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser-flake = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "";
    };
    quickshell = {
      url = "github:quickshell-mirror/quickshell?ref=1e4d804e7f3fa7465811030e8da2bf10d544426a";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { ... }@inputs: {
    nixosConfigurations = {
      hpprobook = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/hpprobook/configuration.nix
          inputs.hjem.nixosModules.default
          inputs.sops-nix.nixosModules.sops
          inputs.preservation.nixosModules.preservation
          {
            hjem = {
              clobberByDefault = true;
              specialArgs = { inherit inputs; };
            };
          }
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
