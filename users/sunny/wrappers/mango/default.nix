{ inputs, pkgs }:

pkgs.symlinkJoin {
  name = "fuzzel-wrapped";
  buildInputs = [ pkgs.makeWrapper ];
  paths = [ inputs.mango.packages.${pkgs.stdenv.hostPlatform.system}.mango ];
  postBuild = ''
    wrapProgram $out/bin/mango \
      --append-flags "-c ${./config.conf}"
  '';
  meta.mainProgram = "mango";
}
