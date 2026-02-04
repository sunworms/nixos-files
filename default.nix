let
  sourcesJson = builtins.fromJSON (builtins.readFile ./various/_sources/generated.json);

  sources = builtins.mapAttrs (name: value:
    let
      src = if value.src.type == "git" then
        fetchGit {
          url = "${value.src.url}";
          rev = "${value.src.rev}";
          shallow = true;
        }
      else
        builtins.fetchurl {
          url = value.src.url;
          sha256 = value.src.sha256;
        };
    in
    value // { inherit src; }
  ) sourcesJson;
  
  nixosSystem = import "${sources.nixpkgs.src}/nixos/lib/eval-config.nix";

  mkHost = hostVars: nixosSystem {
    specialArgs = {
      inherit sources hostVars;
    };

    modules = [
      ./hosts/${hostVars.hostname}/configuration.nix
      {
        nix.nixPath = [
          "nixpkgs=${sources.nixpkgs.src}"
        ];
      }
    ];
  };

in {
  hpprobook = mkHost {
    hostname = "hpprobook";
  };
}
