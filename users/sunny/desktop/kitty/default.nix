{ pkgs, ... }:

{
  xdg.config.files = {
    "kitty/kitty.conf".source = ./kitty.conf;
  };

  packages = with pkgs; [
    kitty
    (runCommand "xdg-terminal-exec-symlink" { } ''
      mkdir -p $out/bin
      ln -sf ${kitty}/bin/kitty $out/bin/xdg-terminal-exec
    '')
  ];
}
