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
        inputs.hjem.nixosModules.default
        inputs.sops-nix.nixosModules.default
        inputs.flatpaks.nixosModules.default
        {
          nixpkgs = {
            config.allowUnfree = true;
            overlays = [
              (final: prev: {
                niri = prev.niri.override {
                  libdisplay-info = prev.libdisplay-info.overrideAttrs (old: {
                    version = "0.3.0";
                    src = prev.fetchFromGitLab {
                      domain = "gitlab.freedesktop.org";
                      owner = "emersion";
                      repo = "libdisplay-info";
                      rev = "0.3.0";
                      hash = "sha256-nXf2KGovNKvcchlHlzKBkAOeySMJXgxMpbi5z9gLrdc=";
                    };
                  });
                };
              })
            ];
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
