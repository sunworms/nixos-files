{ pkgs }:

pkgs.symlinkJoin {
  name = "emacs-wrapped";
  buildInputs = [ pkgs.makeWrapper ];
  paths = [ (pkgs.callPackage ./emacs.nix { }).default ];
  postBuild = ''
    wrapProgram $out/bin/emacs \
      --append-flags "-l ${./init.el}"
  '';
  meta.mainProgram = "emacs";
}
