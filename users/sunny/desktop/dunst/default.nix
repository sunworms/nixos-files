{pkgs, ...}: {
  packages = with pkgs; [
    dunst
    libnotify
    (writeShellScriptBin "bright-osd" (builtins.readFile ./bright-osd.sh))
    (writeShellScriptBin "mic-osd" (builtins.readFile ./mic-osd.sh))
    (writeShellScriptBin "volume-osd" (builtins.readFile ./volume-osd.sh))
  ];
}
