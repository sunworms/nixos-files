{config}: {
  main = {
    include = "~/.config/foot/themes/noctalia";
    shell = "/usr/bin/env fish";
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
