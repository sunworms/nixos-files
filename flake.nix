{
  description = "A normal NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    preservation.url = "github:nix-community/preservation";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-git = {
      url = "github:niri-wm/niri/pull/3483/head";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { ... }@inputs:
    {
      nixosConfigurations.hpprobook = inputs.nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/hpprobook/configuration.nix
          inputs.preservation.nixosModules.preservation
          inputs.sops-nix.nixosModules.default
          inputs.hjem.nixosModules.default
        ];
        specialArgs = {
          inherit inputs;
        };
      };
    };
}
