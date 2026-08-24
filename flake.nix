{
  description = "Sunny's NixOS config";

  outputs = {self, ...} @ inputs: let
    sources = import ./_sources/generated.nix {
      inherit (builtins) fetchurl;
      fetchgit = null;
      fetchFromGitHub = null;
      dockerTools = null;
    };
    assets = ./assets;
  in {
    nixosConfigurations.motobook = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/motobook/configuration.nix
        inputs.preservation.nixosModules.default
        inputs.hjem.nixosModules.default
        inputs.agenix.nixosModules.default
        inputs.umbriel.nixosModules.default
        {
          nixpkgs = {
            config.allowUnfree = true;
            overlays = [];
          };

          hjem = {
            clobberByDefault = true;
            specialArgs = {inherit inputs sources assets;};
          };
        }
      ];
      specialArgs = {
        inherit inputs sources assets;
      };
    };
  };

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
    preservation.url = "github:nix-community/preservation";
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-config = {
      url = "git+https://git.gay/sunworms/neovim-config";
      flake = false;
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
    };
    umbriel = {
      url = "git+https://github.com/noctalia-dev/umbriel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xdg-desktop-portal-umbriel = {
      url = "github:noctalia-dev/xdg-desktop-portal-umbriel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-float-sticky = {
      url = "github:probeldev/niri-float-sticky";
      flake = false;
    };
  };
}
