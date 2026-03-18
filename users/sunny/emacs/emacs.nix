{ pkgs, ... }:

let
  emacsPackagesCustom = pkgs.emacs-unstable-pgtk.pkgs.overrideScope (
    final: prev: {
      eglot = null;
    }
  );

  treesitGrammars = emacsPackagesCustom.treesit-grammars.with-all-grammars;

  emacs-with-packages = emacsPackagesCustom.withPackages (
    epkgs: with epkgs; [
      treesitGrammars
      treesit-auto
      restart-emacs
      magit
      apheleia
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
      go-mode
    ]
  );
in
{
  default = emacs-with-packages;
}
