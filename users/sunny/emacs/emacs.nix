{ pkgs, ... }:

let
  emacsPackagesCustom = pkgs.emacs-unstable-pgtk.pkgs.overrideScope (
    final: prev: {
      eglot = null;
      jsonrpc = null;
    }
  );

  treesitGrammars = emacsPackagesCustom.treesit-grammars.with-all-grammars;

  emacs-with-packages = emacsPackagesCustom.withPackages (
    epkgs: with epkgs; [
      treesitGrammars
      treesit-auto
      telephone-line
      restart-emacs
      evil
      magit
      apheleia
      company
      company-auctex
      company-bibtex
      nix-ts-mode
      pdf-tools
      auctex
      auctex-latexmk
      cdlatex
      xenops
      typst-ts-mode
      rustic
      eglot-java
      direnv
      go-mode
    ]
  );
in
{
  default = emacs-with-packages;
}
