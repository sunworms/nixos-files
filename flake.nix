{
  description = "Sunny's NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-maid.url = "github:viperML/nix-maid";
    niri.url = "github:sodiboo/niri-flake";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = {
    self,
    nixpkgs,
    nix-maid,
    niri,
    spicetify-nix,
    ... }@inputs: {
      nixosConfigurations = {
        hpprobook-nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/hpprobook/configuration.nix
            niri.nixosModules.niri
            nix-maid.nixosModules.default
            spicetify-nix.nixosModules.spicetify
        ];
      };
    };
  };
}
