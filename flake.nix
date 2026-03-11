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
    niri-nix.url = "git+https://codeberg.org/BANanaD3V/niri-nix";
    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    walls = {
      url = "github:sunworms/walls";
      flake = false;
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
          inputs.dms.nixosModules.dank-material-shell
          inputs.dms-plugin-registry.modules.default
          inputs.nix-flatpak.nixosModules.nix-flatpak
        ];
        specialArgs = {
          inherit inputs;
        };
      };
    };
}
