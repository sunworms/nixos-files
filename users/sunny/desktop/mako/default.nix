{pkgs, ...}: {
  packages = with pkgs; [
    mako
    libnotify
    (writeShellScriptBin "volume-osd" (builtins.readFile ./volume-osd.sh))
    (writeShellScriptBin "bright-osd" (builtins.readFile ./bright-osd.sh))
    (writeShellScriptBin "mic-osd" (builtins.readFile ./mic-osd.sh))
  ];

  xdg.config.files."mako/config".source = ./config;
}
