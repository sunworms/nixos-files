{
  description = "A normal NixOS configuration";

  outputs = {self, ...} @ inputs: let
    assets = ./assets;

    sources = import ./_sources/generated.nix {
      inherit (builtins) fetchurl;
      fetchFromGitHub = null;
      fetchgit = null;
      dockerTools = null;
    };
  in {
    nixosConfigurations = {
      motobook = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs sources assets;};
        modules = [
          ./hosts/motobook/configuration.nix
          inputs.preservation.nixosModules.default
          inputs.hjem.nixosModules.default
          inputs.agenix.nixosModules.default
          {
            nixpkgs = {
              config.allowUnfree = true;
              overlays = [inputs.helix-plugins.overlays.default];
            };

            hjem = {
              clobberByDefault = true;
              specialArgs = {inherit inputs sources assets;};
              extraModules = [inputs.helix-plugins.hjemModules.default];
            };
          }
        ];
      };
    };
  };

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.zst";
    preservation.url = "github:nix-community/preservation";
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-nix = {
      url = "git+https://codeberg.org/BANanaD3V/niri-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.niri-unstable.follows = "";
      inputs.xwayland-satellite-unstable.follows = "";
    };
    helix-plugins = {
      url = "github:maxschipper/helix-plugins-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-float-sticky = {
      url = "github:probeldev/niri-float-sticky";
      flake = false;
    };
  };
}
