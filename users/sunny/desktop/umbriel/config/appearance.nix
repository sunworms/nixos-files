{
  appearance = {
    prefer_no_csd = true;
    border_width = 2;
    outer_border_width = 0;
    corner_radius = 12;

    blur = {
      enabled = true;
      passes = 3;
      radius = 3;
      noise = 0.02;
      saturation = 1.5;
    };

    shadow = {
      enabled = true;
      softness = 20;
      offset_x = 0;
      offset_y = 5;
    };
  };

  animation.enabled = false;
}
