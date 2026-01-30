{ pkgs }:

pkgs.symlinkJoin {
  name = "foot-wrapped";
  buildInputs = [ pkgs.makeWrapper ];
  paths = [ pkgs.foot ];
  postBuild = ''
    wrapProgram $out/bin/foot \
      --append-flags "--config=${./foot.ini}"
  '';
  meta.mainProgram = "foot";
}
