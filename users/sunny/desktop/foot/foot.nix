{config}: {
  main = {
    include = [
      "~/.cache/wal/colors-foot-dark.ini"
      "~/.cache/wal/colors-foot-light.ini"
    ];
    font = "${config.fonts.monospace}:size=11.25";
  };

  colors-dark = {
    blur = true;
    alpha = 0.85;
  };

  colors-light = {
    blur = true;
    alpha = 0.85;
  };
}
