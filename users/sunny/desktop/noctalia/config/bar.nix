{
  bar = {
    order = ["default" "right"];

    right = {
      background_opacity = 1.0;
      capsule = true;
      capsule_opacity = 1.0;
      capsule_radius = 8.0;
      enabled = true;
      margin_ends = 0;
      position = "right";
      radius = 0;
      radius_bottom_left = 10;
      radius_top_left = 10;
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
          opacity = 1.0;
          padding = 6.0;
          radius = 8.0;
        }
        {
          enabled = true;
          fill = "surface_variant";
          id = "notif";
          members = ["notifications" "clipboard"];
          opacity = 1.0;
          padding = 6.0;
          radius = 8.0;
        }
        {
          enabled = true;
          fill = "surface_variant";
          id = "mpv";
          members = ["recorder" "widget_2" "mirror"];
          opacity = 1.0;
          padding = 6.0;
          radius = 8.0;
        }
      ];
    };

    default = {
      background_opacity = 1.0;
      capsule = true;
      capsule_opacity = 1.0;
      capsule_radius = 8.0;
      end = ["tray" "group:sysmon" "group:osd"];
      center = ["clock"];
      start = ["group:misc" "group:music"];
      position = "left";
      widget_spacing = 10;
      margin_edge = 0;
      margin_ends = 0;
      radius = 0;
      radius_bottom_right = 10;
      radius_top_right = 10;
      scale = 1.0;
      shadow = false;
      thickness = 30;

      capsule_group = [
        {
          fill = "surface_variant";
          id = "sysmon";
          members = ["cpu" "ram" "temp"];
          opacity = 1.0;
          padding = 6.0;
          radius = 8.0;
        }
        {
          fill = "surface_variant";
          id = "osd";
          members = ["volume" "brightness" "battery"];
          opacity = 1.0;
          padding = 6.0;
          radius = 8.0;
        }
        {
          fill = "surface_variant";
          id = "music";
          members = ["media" "cat" "audio_visualizer"];
          opacity = 1.0;
          padding = 6.0;
          radius = 8.0;
        }
        {
          fill = "surface_variant";
          id = "misc";
          members = ["launcher" "wallpaper" "mpvpaper"];
          opacity = 1.0;
          padding = 6.0;
          radius = 8.0;
        }
      ];
    };
  };
}
