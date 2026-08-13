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
      match._props.title = "discord.com is sharing a window.";
      default-floating-position._props = {
        x = 3000;
        y = 2000;
      };
    }
    {
      match._props.app-id = "xdg_filechooser";
      open-floating = true;
      default-column-width = {
        fixed = 900;
      };
      default-window-height = {
        fixed = 600;
      };
    }
    {
      match._props.app-id = "^org.pwmt.zathura$";
      background-effect = {
        blur = true;
        xray = true;
      };
    }
    {
      geometry-corner-radius = 12;
      clip-to-geometry = true;
      draw-border-with-background = false;
    }
  ];
}
