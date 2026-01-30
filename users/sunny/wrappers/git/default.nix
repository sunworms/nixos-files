{ pkgs }:

pkgs.symlinkJoin {
  name = "git-wrapped";
  buildInputs = [ pkgs.makeWrapper ];
  paths = [ pkgs.git ];
  postBuild = ''
    mkdir -p $out/git
    ln -sf ${./config} $out/git/config

    wrapProgram $out/bin/git \
      --set XDG_CONFIG_HOME $out
  '';
  meta.mainProgram = "git";
}
