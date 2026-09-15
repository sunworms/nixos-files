let
  inputs = import ./_sources/generated.nix {
    inherit (builtins) fetchurl;
    fetchgit = null;
    fetchFromGitHub = null;
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

  droid-pkgs = import inputs.nixpkgs.src {system = "aarch64-linux";};

  droid-eval = import "${inputs.nix-on-droid.src}/modules" {
    pkgs = droid-pkgs;
    config = ./hosts/android/configuration.nix;
    home-manager-path = inputs.droid-hm.src;
  };
in {
  motobook = mkHost {
    hostname = "motobook";

    modules = [
      (inputs.preservation.src + "/module.nix")
      (import inputs.hjem.src {}).nixosModules.default
      (inputs.agenix.src + "/modules/age.nix")

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

  droid = droid-eval.activationPackage;
}
