{ pkgs }:

pkgs.symlinkJoin {
  name = "hyfetch-wrapped";
  buildInputs = [ pkgs.makeWrapper ];
  paths = [ pkgs.hyfetch ];
  postBuild = ''
    wrapProgram $out/bin/hyfetch \
      --append-flags "-C ${./hyfetch.json}"
  '';
  meta.mainProgram = "hyfetch";
}
