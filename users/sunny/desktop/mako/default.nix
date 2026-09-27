{pkgs, ...}: {
  packages = with pkgs; [
    mako
    libnotify
    (writeShellScriptBin "volume-osd" (builtins.readFile ./volume-osd.sh))
    (writeShellScriptBin "bright-osd" (builtins.readFile ./bright-osd.sh))
  ];
}
