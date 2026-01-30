{ pkgs, ... }:

let
  treesitGrammars = pkgs.emacs-pgtk.pkgs.treesit-grammars.with-all-grammars;

  emacs-with-packages = pkgs.emacs-pgtk.pkgs.withPackages (
    epkgs: with epkgs; [
      treesitGrammars
      restart-emacs
      adwaita-dark-theme
      telephone-line
      magit
      lsp-mode
      lsp-ui
      lsp-latex
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
      lsp-java
      direnv
    ]
  );
in
{
  default = emacs-with-packages;
}
