{pkgs, ...}: {
  packages = with pkgs; [
    foot
    (runCommand "xdg-terminal-exec" {} ''
      mkdir -p $out/bin
      ln -sf ${foot}/bin/foot $out/bin/xdg-terminal-exec
    '')
  ];

  xdg.config.files."foot/foot.ini".source = ./foot.ini;
}
