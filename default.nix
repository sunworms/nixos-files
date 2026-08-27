let
  fetchurl = builtins.fetchurl;

  fetchFromGitHub = {
    owner,
    repo,
    rev,
    sha256,
    fetchSubmodules ? false,
    ...
  }:
    if fetchSubmodules
    then
      fetchGit {
        url = "https://github.com/${owner}/${repo}.git";
        inherit rev;
        submodules = true;
      }
    else
      fetchTarball {
        url = "https://github.com/${owner}/${repo}/archive/${rev}.tar.gz";
        inherit sha256;
      };

  fetchgit = {
    url,
    rev,
    ...
  }:
    fetchGit {
      inherit url rev;
    };

  inputs = import ./_sources/generated.nix {
    inherit fetchurl fetchgit fetchFromGitHub;

    dockerTools = null;
  };

  nixosSystem = import "${inputs.nixpkgs.src}/nixos/lib/eval-config.nix";

  assets = ./assets;

  mkHost = hostVars:
    nixosSystem {
      specialArgs = {
        inherit inputs assets;
      };

      modules =
        [
          ./hosts/${hostVars.hostname}/configuration.nix
          {
            nix.nixPath = [
              "nixpkgs=${inputs.nixpkgs.src}"
            ];
          }
        ]
        ++ (hostVars.modules or []);
    };
in {
  motobook = mkHost {
    hostname = "motobook";

    modules = [
      (inputs.preservation.src + "/module.nix")
      (import inputs.hjem.src {}).nixosModules.default
      (inputs.agenix.src + "/modules/age.nix")
      (import (inputs.umbriel.src + "/nix/nixos-module.nix") {
        xdg-desktop-portal-umbriel = null;
      })

      {
        nixpkgs = {
          config.allowUnfree = true;
          overlays = [];
        };

        hjem = {
          clobberByDefault = true;
          specialArgs = {inherit inputs assets;};
        };
      }
    ];
  };
}
