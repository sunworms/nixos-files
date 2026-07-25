{pkgs, ...}: {
  packages = with pkgs; [
    mako
    libnotify
    (writeShellScriptBin "volume-osd" (builtins.readFile ./volume-osd))
    (writeShellScriptBin "bright-osd" (builtins.readFile ./bright-osd))
  ];
}
