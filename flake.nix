{
  description = "A normal NixOS flake";

  outputs =
    { ... }@args:
    let
      # Use inputs from tack, instead of flake inputs
      inputs = (import ./.tack) {
        overrides = args.tackOverrides or { };
      };
    in
    {
      nixosConfigurations.motobook = inputs.nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/motobook/configuration.nix
          inputs.preservation.nixosModules.default
          inputs.hjem.nixosModules.default
          inputs.sops-nix.nixosModules.default
          inputs.flatpaks.nixosModules.default
          {
            nixpkgs.overlays = [
              inputs.emacs-overlay.overlays.default
            ];
          }
        ];
        specialArgs = {
          inherit inputs;
        };
      };
    };
}
