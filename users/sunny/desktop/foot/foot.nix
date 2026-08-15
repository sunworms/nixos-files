{config}: {
  main = {
    include = "~/.config/foot/themes/noctalia";
    font = "${config.fonts.monospace}:size=12";
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
