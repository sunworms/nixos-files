{ pkgs, ... }:

let
  treesitGrammars = pkgs.emacs-pgtk.pkgs.treesit-grammars.with-all-grammars;

  emacs-with-packages = pkgs.emacs-pgtk.pkgs.withPackages (
    epkgs: with epkgs; [
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
    ]
  );
in
{
  default = emacs-with-packages;
}
