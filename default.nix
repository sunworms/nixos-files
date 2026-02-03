let
  sourcesJson = builtins.fromJSON (builtins.readFile ./various/_sources/generated.json);

  nixpkgs = fetchTarball {
    url = "${sourcesJson.nixpkgs.src.url}/archive/${sourcesJson.nixpkgs.src.rev}.tar.gz";
    sha256 = sourcesJson.nixpkgs.src.sha256;
  };

  sources = (import nixpkgs { }).callPackage ./various/_sources/generated.nix { }; 
  
  nixosSystem = import "${nixpkgs}/nixos/lib/eval-config.nix";

  mkHost = hostVars: nixosSystem {
    specialArgs = {
      inherit sources hostVars;
    };

    modules = [
      ./hosts/${hostVars.hostname}/configuration.nix
      {
        nix.nixPath = [
          "nixpkgs=${nixpkgs}"
        ];
      }
    ];
  };

in {
  hpprobook = mkHost {
    hostname = "hpprobook";
  };
}
