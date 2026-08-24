let
  inputs = import ./npins;
  sources = import ./_sources/generated.nix {
    inherit (builtins) fetchurl;
    fetchgit = null;
    fetchFromGitHub = null;
    dockerTools = null;
  };
  assets = ./assets;

  nixosSystem = import "${inputs.nixpkgs}/nixos/lib/eval-config.nix";

  mkHost = hostVars:
    nixosSystem {
      specialArgs = {
        inherit inputs sources assets;
      };

      modules =
        [
          ./hosts/${hostVars.hostname}/configuration.nix
          {
            nix.nixPath = [
              "nixpkgs=${inputs.nixpkgs}"
            ];
          }
        ]
        ++ (hostVars.modules or []);
    };
in {
  motobook = mkHost {
    hostname = "motobook";
    modules = [
      (inputs.preservation + "/module.nix")
      (import inputs.hjem {}).nixosModules.default
      (inputs.agenix + "/modules/age.nix")
      (inputs.umbriel + "/nix/nixos-module.nix")
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
  };
}
