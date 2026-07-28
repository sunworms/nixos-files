{
  description = "A normal NixOS flake";

  outputs = {...} @ args: let
    inputs = (import ./.tack) {
      overrides = args.tackOverrides or {};
    };
  in {
    nixosConfigurations.motobook = inputs.nixpkgs-patcher.lib.nixosSystem {
      nixpkgsPatcher = {
        nixpkgs = inputs.nixpkgs;
        patches = pkgs:
          with pkgs; [
            (fetchurl {
              name = "niri-fix.patch";
              url = "https://github.com/NixOS/nixpkgs/pull/546004.diff";
              hash = "sha256-dGgYOPiUf+dxtopuq2sg2BJClB0BjQ76GiXdVhQAbbs=";
            })
          ];
      };

      modules = [
        ./hosts/motobook/configuration.nix
        inputs.preservation.nixosModules.default
        inputs.hjem.nixosModules.default
        inputs.sops-nix.nixosModules.default
        inputs.flatpaks.nixosModules.default
        {
          nixpkgs = {
            config.allowUnfree = true;
            overlays = [];
          };

          hjem = {
            clobberByDefault = true;
            specialArgs = {inherit inputs;};
          };
        }
      ];
      specialArgs = {
        inherit inputs;
      };
    };
  };
}
