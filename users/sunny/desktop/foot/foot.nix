{config}: {
  main = {
    include = "~/.cache/wal/foot.ini";
    font = "${config.fonts.monospace}:size=11";
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
