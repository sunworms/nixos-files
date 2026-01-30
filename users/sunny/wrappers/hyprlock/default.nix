{ pkgs }:

pkgs.symlinkJoin {
  name = "hyprlock-wrapped";
  buildInputs = [ pkgs.makeWrapper ];
  paths = [ pkgs.hyprlock ];
  postBuild = ''
    wrapProgram $out/bin/hyprlock \
      --append-flags "-c ${./config.conf}"
  '';
  meta.mainProgram = "hyprlock";
}
