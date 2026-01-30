{ pkgs }:

pkgs.symlinkJoin {
  name = "fish-wrapped";
  buildInputs = [ pkgs.makeWrapper ];
  paths = [ pkgs.fish ];
  postBuild = ''
    wrapProgram $out/bin/fish \
      --append-flags "-C 'source ${./config.fish}'"
  '';
  meta.mainProgram = "fish";
  passthru.shellPath = "/bin/fish";
}
