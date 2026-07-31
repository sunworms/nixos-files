{
  plugins = {
    enabled = [
      "noctalia/screen_recorder"
      "noctalia/kaomoji"
      "noctalia/bongocat"
      "noctalia/mpvpaper"
      "oldirtty/color_picker"
      "elijaharch/wl-screen-mirror"
      "cleboost/hotspot"
    ];
  };

  plugin_settings = {
    "noctalia/mpvpaper" = {
      video_directory = "/home/sunny/Pictures/walls/videos";
    };

    "oldirtty/color_picker" = {
      hyprpicker-lowercase = true;
    };
  };
}
