{ pkgs, sources, ... }:

let
  emacsPackagesCustom = pkgs.emacs-pgtk.pkgs.overrideScope (
    final: prev: {
      eglot = null;
    }
  );

  treesitGrammars = emacsPackagesCustom.treesit-grammars.with-all-grammars;

  emacs-with-packages = emacsPackagesCustom.withPackages (
    epkgs: with epkgs; [
      base16-theme # fallback theme
      git-auto-commit-mode # for org mode
      indent-bars
      treesitGrammars
      restart-emacs
      telephone-line
      magit
      company
      company-auctex
      company-bibtex
      nix-mode
      pdf-tools
      auctex
      auctex-latexmk
      cdlatex
      xenops
      typst-ts-mode
      typst-preview
      rustic
      eglot-java
      direnv
      (pkgs.callPackage ./atomic-chrome.nix {
        inherit (epkgs) melpaBuild websocket;
        inherit sources;
      })
    ]
  );
in
{
  default = emacs-with-packages;
}
