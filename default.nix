let
  inputs = import ./_sources/generated.nix {
    inherit (builtins) fetchurl;
    fetchgit = null;
    fetchFromGitHub = null;
    dockerTools = null;
  };
  assets = ./assets;

  nixosSystem = import "${inputs.nixpkgs.src}/nixos/lib/eval-config.nix";

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
      (inputs.sops-nix.src + "/modules/sops")
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
