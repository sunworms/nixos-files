{
  description = "A normal NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    preservation.url = "github:nix-community/preservation";
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-blur = {
      url = "github:niri-wm/niri/pull/3483/head";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, ... }@inputs:
    let
      secrets = builtins.fromJSON (builtins.readFile "${self}/secrets/secrets.json");
    in
    {
      nixosConfigurations.motobook = inputs.nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/motobook/configuration.nix
          inputs.preservation.nixosModules.preservation
          inputs.hjem.nixosModules.default
        ];
        specialArgs = {
          inherit inputs secrets;
        };
      };
    };
}
