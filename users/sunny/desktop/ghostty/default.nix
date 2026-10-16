{
  pkgs,
  lib,
  config,
  ...
}: {
  packages = with pkgs; [
    ghostty
    (writeShellScriptBin "xdg-terminal-exec" ''
      exec ${lib.getExe ghostty} -e "$@"
    '')
  ];

  xdg.config.files."ghostty/config".text = ''
    config-file = /home/sunny/.cache/wal/ghostty-colors
    font-family = ${config.fonts.monospace}
    font-size = 11
    background-opacity = 0.85
  '';
}
