{ pkgs }:

pkgs.symlinkJoin {
  name = "fuzzel-wrapped";
  buildInputs = [ pkgs.makeWrapper ];
  paths = [ pkgs.fuzzel ];
  postBuild = ''
    wrapProgram $out/bin/fuzzel \
      --append-flags "--config=${./fuzzel.ini}"
  '';
  meta.mainProgram = "fuzzel";
}
