{ pkgs, sources, ... }:

let
  emacsPackagesCustom = pkgs.emacs-pgtk.pkgs.overrideScope (
    final: prev: {
      eglot = null;
    }
  );

  treesitGrammars = emacsPackagesCustom.treesit-grammars.with-grammars (
    grammars: with grammars; [
      tree-sitter-typst
      tree-sitter-latex
      tree-sitter-nix
      tree-sitter-rust
      tree-sitter-go
      tree-sitter-elisp
    ]
  );

  emacs-with-packages = emacsPackagesCustom.withPackages (
    epkgs: with epkgs; [
      git-auto-commit-mode # for org mode
      apheleia
      indent-bars
      treesitGrammars
      restart-emacs
      telephone-line
      meow
      magit
      company
      company-auctex
      company-bibtex
      yasnippet
      nix-mode
      go-mode
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
      (pkgs.callPackage ./everforest.nix {
        inherit (epkgs) melpaBuild;
        inherit sources;
      })
    ]
  );
in
{
  default = emacs-with-packages;
}
