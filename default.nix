let
  inputs = import ./.tack;
  nixosSystem = import "${inputs.nixpkgs}/nixos/lib/eval-config.nix";

  mkHost =
    hostVars:
    nixosSystem {
      specialArgs = {
        inherit inputs hostVars;
      };

      modules = [
        ./hosts/${hostVars.hostname}/configuration.nix
        {
          nix.nixPath = [
            "nixpkgs=${inputs.nixpkgs}"
          ];
        }
      ]
      ++ (hostVars.modules or [ ]);
    };

in
{
  motobook = mkHost {
    hostname = "motobook";
    modules = [
      (inputs.preservation + "/module.nix")
      (import inputs.hjem { }).nixosModules.default
      (inputs.sops-nix + "/modules/sops")
      (inputs.flatpaks + "/nixos")
      {
        nixpkgs = {
          config.allowUnfree = true;
          overlays = [
            (import inputs.emacs-overlay)
          ];
        };

        hjem = {
          clobberByDefault = true;
          specialArgs = { inherit inputs; };
        };
      }
    ];
  };
}
