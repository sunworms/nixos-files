{ inputs, pkgs }:

let
  changedConfig = pkgs.replaceVars ./config.conf {
    inherit (pkgs.pantheon) pantheon-agent-polkit;
    DEFAULT_AUDIO_SINK = null;
    DEFAULT_AUDIO_SOURCE = null;
  };
in
pkgs.symlinkJoin {
  name = "fuzzel-wrapped";
  buildInputs = [ pkgs.makeWrapper ];
  paths = [ inputs.mango.packages.${pkgs.stdenv.hostPlatform.system}.mango ];
  postBuild = ''
    wrapProgram $out/bin/mango \
      --append-flags "-c ${changedConfig}"
  '';
  meta.mainProgram = "mango";
}
