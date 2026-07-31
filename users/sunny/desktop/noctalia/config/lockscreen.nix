{
  lockscreen_widgets = {
    enabled = true;
    schema_version = 2;
    widget_order = [
      "login-box"
      "logout"
      "shutdown"
      "reboot"
      "suspend"
      "media"
      "clock"
      "weather"
      "sysmon"
    ];

    grid = {
      cell_size = 16;
      major_interval = 4;
      visible = true;
    };

    widget = {
      "login-box" = {
        box_height = 103.0;
        box_width = 400.0;
        cx = 823.0;
        cy = 806.0;
        output = "eDP-1";
        rotation = 0.0;
        type = "login_box";

        settings = {
          background_color = "surface_variant";
          background_opacity = 1.0;
          background_radius = 12.0;
          input_opacity = 1.0;
          input_radius = 6.0;
          show_login_button = true;
          layout = "compact";
        };
      };

      logout = {
        box_height = 48.0;
        box_width = 48.0;
        cx = 727.0;
        cy = 986.5;
        output = "eDP-1";
        rotation = 0.0;
        type = "button";

        settings = {
          background = true;
          command = "noctalia msg session logout";
          glyph = "logout";
          variant = "default";
        };
      };

      shutdown = {
        box_height = 48.0;
        box_width = 48.0;
        cx = 919.0;
        cy = 986.5;
        output = "eDP-1";
        rotation = 0.0;
        type = "button";

        settings = {
          background = true;
          command = "noctalia msg session shutdown";
          glyph = "shutdown";
          variant = "default";
        };
      };

      reboot = {
        box_height = 48.0;
        box_width = 48.0;
        cx = 855.0;
        cy = 986.5;
        output = "eDP-1";
        rotation = 0.0;
        type = "button";

        settings = {
          background = true;
          command = "noctalia msg session reboot";
          glyph = "reboot";
          variant = "default";
        };
      };

      suspend = {
        box_height = 48.0;
        box_width = 48.0;
        cx = 791.0;
        cy = 986.5;
        output = "eDP-1";
        rotation = 0.0;
        type = "button";

        settings = {
          background = true;
          command = "noctalia msg session lock-and-suspend";
          glyph = "suspend";
          variant = "default";
        };
      };

      media = {
        box_height = 0.0;
        box_width = 0.0;
        cx = 823.0;
        cy = 290.5;
        output = "eDP-1";
        rotation = 0.0;
        type = "media_player";
      };

      clock = {
        box_height = 128.0;
        box_width = 208.0;
        cx = 823.0;
        cy = 578.5;
        output = "eDP-1";
        rotation = 0.0;
        type = "clock";

        settings = {
          center_text = true;
          clock_style = "digital";
          format = "{:%H:%M\\n%a, %b %d}";
        };
      };

      weather = {
        box_height = 128.0;
        box_width = 208.0;
        cx = 1095.0;
        cy = 578.5;
        output = "eDP-1";
        rotation = 0.0;
        type = "weather";

        settings = {
          forecast_days = 2;
          show_forecast = true;
        };
      };

      sysmon = {
        box_height = 0.0;
        box_width = 0.0;
        cx = 551.0;
        cy = 578.5;
        output = "eDP-1";
        rotation = 0.0;
        type = "sysmon";

        settings = {
          stat = "cpu_usage";
          stat2 = "ram_pct";
        };
      };
    };
  };
}
