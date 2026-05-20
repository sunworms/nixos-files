{ pkgs, ... }:

{
  packages = with pkgs; [
    alacritty
    (writeShellScriptBin "xdg-terminal-exec" ''
      exec ${pkgs.alacritty}/bin/alacritty -e "$@"
    '')
  ];

  xdg.config.files."alacritty/alacritty.toml".source = ./alacritty.toml;
}
