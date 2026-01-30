{ pkgs }:

pkgs.symlinkJoin {
  name = "fnott-wrapped";
  buildInputs = [ pkgs.makeWrapper ];
  paths = [ pkgs.fnott ];
  postBuild = ''
    wrapProgram $out/bin/fnott \
      --append-flags "--config=${./fnott.ini}"
  '';
  meta.mainProgram = "fnott";
}
