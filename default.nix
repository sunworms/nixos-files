let
  inputs = import ./npins;
  sources = builtins.fromJSON (builtins.readFile ./_sources/generated.json);
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
      (inputs.sops-nix + "/modules/sops")
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
