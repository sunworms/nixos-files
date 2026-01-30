{ pkgs }:

pkgs.symlinkJoin {
  name = "zathura-wrapped";
  buildInputs = [ pkgs.makeWrapper ];
  paths = [ pkgs.zathura ];
  postBuild = ''
    wrapProgram $out/bin/zathura \
      --append-flags "-c ${./.}"
  '';
  meta.mainProgram = "zathura";
}
