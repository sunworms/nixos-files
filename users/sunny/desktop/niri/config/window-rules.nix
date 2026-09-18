{
  window-rule = [
    {
      match._props.app-id._raw = ''r#"^org\.wezfurlong\.wezterm$"#'';
      default-column-width = {};
    }
    {
      match = [
        {_props.title = "Picture-in-Picture";}
        {_props.title = "Picture in picture";}
      ];
      open-floating = true;
      default-floating-position._props = {
        x = 1025;
        y = 225;
      };
      default-column-width.fixed = 525;
      default-window-height.fixed = 295;
    }
    {
      match._props.title = ".+?is sharing a window.$";
      default-floating-position._props = {
        x = 3000;
        y = 2000;
      };
    }
    {
      geometry-corner-radius = 12;
      clip-to-geometry = true;
      draw-border-with-background = false;
    }
  ];
}
