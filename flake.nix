{
  description = "A normal NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    preservation.url = "github:nix-community/preservation";
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri.url = "github:sodiboo/niri-flake";
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helix.url = "github:helix-editor/helix";
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
          inputs.niri.nixosModules.niri
        ];
        specialArgs = {
          inherit inputs;
        };
      };
    };
}
