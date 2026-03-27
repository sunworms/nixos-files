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
    niri-blur = {
      url = "github:niri-wm/niri/pull/3483/head";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell?rev=08058326f04e9b5e55c903b3702405a8d3556ac6";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";
    };
    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms-base46 = {
      url = "github:AvengeMedia/base46";
      flake = false;
    };
  };

  outputs =
    { ... }@inputs:
    {
      nixosConfigurations.motobook = inputs.nixpkgs.lib.nixosSystem {
        modules = [
          ../hosts/motobook/configuration.nix
          inputs.preservation.nixosModules.preservation
          inputs.sops-nix.nixosModules.default
          inputs.hjem.nixosModules.default
          inputs.dms.nixosModules.dank-material-shell
          inputs.dms-plugin-registry.modules.default
        ];
        specialArgs = {
          inherit inputs;
        };
      };
    };
}
