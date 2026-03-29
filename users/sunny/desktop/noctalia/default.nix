{
  pkgs,
  sources,
  lib,
  ...
}:

let
  sourcesJson = builtins.fromJSON (builtins.readFile ../../../../_sources/generated.json);
  src-shell = fetchGit {
    url = "https://github.com/${sourcesJson.noctalia.src.owner}/${sourcesJson.noctalia.src.repo}";
    rev = sourcesJson.noctalia.src.rev;
    shallow = true;
  };
  src-qs = fetchGit {
    url = "https://github.com/${sourcesJson.noctalia-qs.src.owner}/${sourcesJson.noctalia-qs.src.repo}";
    rev = sourcesJson.noctalia-qs.src.rev;
    shallow = true;
  };

  mkDate =
    longDate:
    lib.concatStringsSep "-" [
      (builtins.substring 0 4 longDate)
      (builtins.substring 4 2 longDate)
      (builtins.substring 6 2 longDate)
    ];

  version-shell =
    mkDate (src-shell.lastModifiedDate or "19700101") + "_" + (src-shell.shortRev or "dirty");
  version-qs = mkDate (src-qs.lastModifiedDate or "19700101") + "_" + (src-qs.shortRev or "dirty");
  gitRev-qs = src-qs.rev or src-qs.dirtyRev or "dirty";

  noctalia-shell = pkgs.callPackage "${sources.noctalia.src}/nix/package.nix" {
    version = version-shell;
  };
  noctalia-qs = pkgs.callPackage "${sources.noctalia-qs.src}/nix/package.nix" {
    version = version-qs;
    gitRev = gitRev-qs;
  };
in
{
  imports = [
    ./plugins.nix
  ];

  packages = [
    (noctalia-shell.override {
      quickshell = noctalia-qs;
    })
  ];

  xdg.config.files = {
    "noctalia/user-templates.toml".source = ./user-templates.toml;
    "noctalia/settings.json".source = ./settings.json;
    "noctalia/plugins.json".source = ./plugins.json;
  };
}
