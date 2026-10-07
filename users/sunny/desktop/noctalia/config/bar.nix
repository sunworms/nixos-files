{
  bar = {
    order = ["default" "right"];

    right = {
      background_opacity = 1.0;
      capsule = true;
      capsule_opacity = 1.0;
      capsule_radius = 6.0;
      scale = 1.0;
      enabled = true;
      margin_ends = 0;
      position = "right";
      radius = 0;
      radius_bottom_left = 8;
      radius_top_left = 8;
      shadow = true;
      start = ["taskbar"];
      center = ["workspaces"];
      end = ["group:net" "group:notif" "group:mpv"];
      thickness = 30;

      capsule_group = [
        {
          enabled = true;
          fill = "surface_variant";
          id = "net";
          members = ["network" "toggle" "bluetooth"];
          padding = 6.0;
        }
        {
          enabled = true;
          fill = "surface_variant";
          id = "notif";
          members = ["notifications" "clipboard"];
          padding = 6.0;
        }
        {
          enabled = true;
          fill = "surface_variant";
          id = "mpv";
          members = ["recorder" "widget" "mirror"];
          padding = 6.0;
        }
      ];
    };

    default = {
      background_opacity = 1.0;
      capsule = true;
      capsule_opacity = 1.0;
      capsule_radius = 6.0;
      end = ["tray" "group:sysmon" "group:osd"];
      center = ["clock"];
      start = ["group:misc" "group:music"];
      position = "left";
      widget_spacing = 10;
      margin_edge = 0;
      margin_ends = 0;
      radius = 0;
      radius_bottom_right = 8;
      radius_top_right = 8;
      scale = 1.0;
      shadow = true;
      thickness = 30;

      capsule_group = [
        {
          fill = "surface_variant";
          id = "sysmon";
          members = ["cpu" "ram" "temp"];
          padding = 6.0;
        }
        {
          fill = "surface_variant";
          id = "osd";
          members = ["volume" "brightness" "battery"];
          padding = 6.0;
        }
        {
          fill = "surface_variant";
          id = "music";
          members = ["media" "cat" "audio_visualizer"];
          padding = 6.0;
        }
        {
          fill = "surface_variant";
          id = "misc";
          members = ["launcher" "wallpaper" "mpvpaper"];
          padding = 6.0;
        }
      ];
    };
  };
}
