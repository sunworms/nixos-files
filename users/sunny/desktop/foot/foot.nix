{config}: {
  main = {
    include = "~/.config/foot/themes/noctalia";
    font = "${config.fonts.monospace}:size=11.25";
  };

  colors-dark = {
    alpha = 0.8;
    blur = "yes";
  };

  colors-light = {
    alpha = 0.8;
    blur = "yes";
  };
}
