{
  description = "A normal NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    preservation.url = "github:nix-community/preservation";
    flatpaks.url = "github:in-a-dil-emma/declarative-flatpak/latest";
    helix.url = "github:helix-editor/helix";
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell/v5";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { ... }@inputs:
    {
      nixosConfigurations.motobook = inputs.nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/motobook/configuration.nix
          inputs.preservation.nixosModules.default
          inputs.hjem.nixosModules.default
          inputs.sops-nix.nixosModules.default
          inputs.flatpaks.nixosModules.default
        ];
        specialArgs = {
          inherit inputs;
        };
      };
    };
}
