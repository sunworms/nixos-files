{
  plugins = {
    enabled = [
      "noctalia/screen_recorder"
      "noctalia/kaomoji"
      "noctalia/bongocat"
      "noctalia/mpvpaper"
      "elijaharch/wl-screen-mirror"
      "cleboost/hotspot"
      "alexander/screen-toolkit"
      "ezequiel/mango_layouts"
    ];
  };

  plugin_settings = {
    "noctalia/mpvpaper" = {
      video_directory = "/home/sunny/Pictures/walls/videos";
    };
    "alexander/screen-toolkit" = {
      panel-full_placement = "attached";
      panel-legacy_placement = "attached";
      panel_placement = "attached";
      result_placement = "attached";
    };
    "cleboost/hotspot" = {
      panel_open_near_click = false;
    };
    "elijaharch/wl-screen-mirror" = {
      controls_open_near_click = false;
    };
    "ezequiel/mango_layouts" = {
      panel_placement = "attached";
    };
  };
}
