{pkgs, ...}: {
  packages = with pkgs; [
    swaynotificationcenter
    libnotify
    (writeShellScriptBin "volume-osd" (builtins.readFile ./volume-osd.sh))
    (writeShellScriptBin "bright-osd" (builtins.readFile ./bright-osd.sh))
  ];

  xdg.config.files = {
    "swaync/config.json".source = ./config.json;
    "swaync/style.css".source = ./style.css;
  };
}
