{ pkgs, ... }:

let
  emacsPackagesCustom = pkgs.emacs-pgtk.pkgs.overrideScope (final: prev: {
    eglot = null;
  });

  treesitGrammars = emacsPackagesCustom.treesit-grammars.with-all-grammars;

  emacs-with-packages = emacsPackagesCustom.withPackages (
    epkgs: with epkgs; [
      dracula-theme # fallback theme
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
    ]
  );
in
{
  default = emacs-with-packages;
}
