{
  description = "A normal NixOS flake";

  outputs = {...} @ args: let
    inputs = (import ./.tack) {
      overrides = args.tackOverrides or {};
    };

    sources = builtins.fromJSON (builtins.readFile ./_sources/generated.json);
  in {
    nixosConfigurations.motobook = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/motobook/configuration.nix
        inputs.preservation.nixosModules.default
        inputs.hjem.nixosModules.default
        inputs.sops-nix.nixosModules.default
        {
          nixpkgs = {
            config.allowUnfree = true;
            overlays = [];
          };

          hjem = {
            clobberByDefault = true;
            specialArgs = {inherit inputs sources;};
          };
        }
      ];
      specialArgs = {
        inherit inputs sources;
      };
    };
  };
}
