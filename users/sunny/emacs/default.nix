{ pkgs, ... }:

{
  packages = with pkgs; [
    (callPackage ./emacs.nix { }).default
    rassumfrassum
  ];

  files = {
    ".emacs.d/init.el".source = ./init.el;
    ".emacs.d/early-init.el".source = ./early-init.el;
    ".emacs.d/lisp".source = ./lisp;
  };
}
