{
  inputs ?
    import ../../../_sources/generated.nix {
      inherit (builtins) fetchurl;
      fetchFromGitHub = null;
      fetchgit = null;
      dockerTools = null;
    },
  pkgs ?
    import inputs.nixpkgs.src {
      config.allowUnfree = true;
    },
}:
pkgs.mkShellNoCC {
  packages = [(import ./package.nix {inherit pkgs inputs;}).devMode];
}
