let
  sourcesJson = builtins.fromJSON (builtins.readFile ./various/_sources/generated.json);

  sources = import ./sources.nix sourcesJson;

  nixosSystem = import "${sources.nixpkgs.src}/nixos/lib/eval-config.nix";

  mkHost =
    hostVars:
    nixosSystem {
      specialArgs = {
        inherit sources hostVars;
      };

      modules = [
        ./hosts/${hostVars.hostname}/configuration.nix
        "${sources.preservation.src}/module.nix"
        "${sources.sops-nix.src}/modules/sops"
        (import sources.hjem.src { }).nixosModules.default
        {
          nix.nixPath = [
            "nixpkgs=${sources.nixpkgs.src}"
          ];
        }
      ];
    };

in
{
  hpprobook = mkHost {
    hostname = "hpprobook";
  };
}
