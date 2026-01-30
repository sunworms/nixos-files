{ pkgs }:

pkgs.symlinkJoin {
  name = "waybar-wrapped";
  buildInputs = [ pkgs.makeWrapper ];
  paths = [ pkgs.waybar ];
  postBuild = ''
    wrapProgram $out/bin/waybar \
      --append-flags "-c ${./config.jsonc}" \
      --append-flags "-s ${./style.css}"
  '';
  meta.mainProgram = "waybar";
}
