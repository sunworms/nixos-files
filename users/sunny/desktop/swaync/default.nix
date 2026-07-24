{pkgs, ...}: {
  packages = with pkgs; [
    swaynotificationcenter
    libnotify
    (writeShellScriptBin "volume-osd" (builtins.readFile ./volume-osd))
    (writeShellScriptBin "bright-osd" (builtins.readFile ./bright-osd))
  ];

  xdg.config.files = {
    "swaync/style.css".source = ./style.css;
    "swaync/config.json".text = builtins.toJSON {
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;
    };
  };
}
