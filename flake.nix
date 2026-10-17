{
  description = "A normal NixOS flake";

  outputs = {...} @ args: let
    assets = ./assets;
    inputs = (import ./.tack) {
      overrides = args.tackOverrides or {};
    };
  in {
    nixosConfigurations.motobook = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/motobook/configuration.nix
        inputs.preservation.nixosModules.default
        inputs.hjem.nixosModules.default
        inputs.agenix.nixosModules.default
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
      specialArgs = {
        inherit inputs assets;
      };
    };
  };
}
