let
  inputs = import ./.tack;

  nixosSystem = import "${inputs.nixpkgs}/nixos/lib/eval-config.nix";

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
