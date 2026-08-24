{
  window_rule = [
    {
      match.title = "Picture-in-Picture|Picture in picture";
      default_floating = true;
      default_size = [525 295];
      default_position = {
        x = 1025;
        y = 225;
        anchor = "top_left";
      };
      default_pinned = true;
    }
    {
      match.title = ".+?is sharing a window.$";
      default_floating = true;
      default_position = {
        x = 3000;
        y = 2000;
        anchor = "top_left";
      };
    }
    {
      match.app_id = "xdg_filechooser|dev.noctalia.UmbrielSharePicker";
      default_floating = true;
      default_size = [900 600];
      blur = true;
    }
    {
      match.app_id = "^org.pwmt.zathura$|^foot$";
      blur = true;
    }
  ];
}
