{
  layout = {
    mode = "scrolling";
    gap = 5;
    width_presets = [0.333 0.5 0.667 1.0];
    scrolling = {
      default_width_fraction = 1.0;
    };
  };
  workspace = [
    {
      index = 2;
      layout.mode = "dwindle";
    }
    {
      index = 4;
      layout.mode = "dwindle";
    }
  ];
}
