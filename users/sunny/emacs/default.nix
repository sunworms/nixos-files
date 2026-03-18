{ pkgs, ... }:

{
  packages = [
    (pkgs.callPackage ./emacs.nix { }).default
  ];

  files = {
    ".emacs.d/init.el".source = ./init.el;
    ".emacs.d/early-init.el".source = ./early-init.el;
    ".emacs.d/lisp".source = ./lisp;
  };
}
