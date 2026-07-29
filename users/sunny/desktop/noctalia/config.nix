{pkgs}: {
  audio = {
    enable_overdrive = true;
  };

  calendar = {
    enabled = true;
    account = {
      personal_google = {
        color = "primary";
        name = "Sunny's calendar";
        type = "google";
      };
    };
  };

  osd = {
    background_opacity = 0.9;
  };

  bar = {
    order = ["default" "right"];

    right = {
      background_opacity = 0.9;
      capsule = true;
      capsule_opacity = 0.9;
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
          opacity = 0.9;
          padding = 6.0;
          radius = 8.0;
        }
        {
          enabled = true;
          fill = "surface_variant";
          id = "notif";
          members = ["notifications" "clipboard"];
          opacity = 0.9;
          padding = 6.0;
          radius = 8.0;
        }
        {
          enabled = true;
          fill = "surface_variant";
          id = "mpv";
          members = ["recorder" "widget" "mirror"];
          opacity = 0.9;
          padding = 6.0;
          radius = 8.0;
        }
      ];
    };

    default = {
      background_opacity = 0.9;
      capsule = true;
      capsule_opacity = 0.9;
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
      attach_panels = true;

      capsule_group = [
        {
          fill = "surface_variant";
          id = "sysmon";
          members = ["cpu" "ram" "temp"];
          opacity = 0.9;
          padding = 6.0;
          radius = 8.0;
        }
        {
          fill = "surface_variant";
          id = "osd";
          members = ["volume" "brightness" "battery"];
          opacity = 0.9;
          padding = 6.0;
          radius = 8.0;
        }
        {
          fill = "surface_variant";
          id = "music";
          members = ["media" "cat" "audio_visualizer"];
          opacity = 0.9;
          padding = 6.0;
          radius = 8.0;
        }
        {
          fill = "surface_variant";
          id = "misc";
          members = ["launcher" "wallpaper" "mpvpaper"];
          opacity = 0.9;
          padding = 6.0;
          radius = 8.0;
        }
      ];
    };
  };

  idle = {
    behavior_order = ["idle-behavior" "idle-behavior-2"];

    behavior = {
      idle-behavior = {
        action = "lock";
        enabled = true;
        timeout = 300;
      };

      idle-behavior-2 = {
        action = "screen_off";
        enabled = true;
        timeout = 600;
      };
    };
  };

  location = {
    auto_locate = false;
  };

  dock = {
    auto_hide = true;
    background_opacity = 0.9;
    enabled = false;
    position = "top";
  };

  notification = {
    background_opacity = 0.9;
  };

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
          background_opacity = 0.88;
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

  shell = {
    avatar_path = "/home/sunny/.face";
    clipboard_auto_paste = "off";
    password_style = "random";
    polkit_agent = true;
    settings_show_advanced = true;
    telemetry_enabled = false;
    clipboard_image_action_command = "satty -f -";

    panel = {
      transparency_mode = "glass";
      clipboard_placement = "attached";
      launcher_placement = "attached";
      attach_session = true;
    };

    launcher = {
      app_grid = true;
      compact = true;
      sort_by_usage = false;
    };

    session = {
      actions = [
        {
          action = "lock";
          enabled = true;
          variant = "default";
        }
        {
          action = "logout";
          enabled = true;
          variant = "default";
        }
        {
          action = "lock_and_suspend";
          enabled = true;
          variant = "default";
        }
        {
          action = "command";
          command = "pkill noctalia; noctalia -d";
          enabled = true;
          glyph = "noctalia";
          label = "Restart Noctalia";
          variant = "default";
        }
        {
          action = "reboot";
          enabled = true;
          variant = "default";
        }
        {
          action = "shutdown";
          enabled = true;
          variant = "default";
        }
      ];
    };
  };

  theme = {
    builtin = "Noctalia";
    source = "wallpaper";
    wallpaper_scheme = "faithful";
    community_palette = "GruvboxAlt";

    templates = {
      builtin_ids = ["kitty" "gtk3" "gtk4" "kcolorscheme" "qt" "niri"];
      community_ids = ["discord" "pywalfox"];

      user = {
        nvim-base16 = {
          input_path = "~/.config/noctalia/templates/matugen-template.lua";
          output_path = "~/.config/matugen/neovim.lua";
          post_hook = "pkill -SIGUSR1 nvim";
        };

        zathura = {
          input_path = "~/.config/noctalia/templates/zathurarc";
          output_path = "~/.config/zathura/zathurarc";
        };
      };
    };
  };

  wallpaper = {
    directory = "/home/sunny/Pictures/walls";
  };

  widget = {
    audio_visualizer = {
      centered = false;
      color_2 = "secondary";
    };

    clock = {
      format = "{:%a, %d.%m.%y, %H:%M}";
      tooltip_format = "{:%a, %d %b %Y, %H:%M:%S}";
      vertical_format = "{:%d\\n%m\\n%y\\n-\\n%H\\n%M}";
    };

    taskbar = {
      capsule = true;
      group_by_workspace = true;
    };

    network = {
      show_label = false;
    };

    workspaces = {
      display = "none";
    };

    cpu = {
      display = "gauge";
      show_label = false;
      type = "sysmon";
    };

    ram = {
      display = "gauge";
      show_label = false;
      stat = "ram_used";
      type = "sysmon";
    };

    temp = {
      show_label = false;
      stat = "cpu_temp";
      type = "sysmon";
    };

    brightness = {
      show_label = false;
    };

    volume = {
      show_label = false;
    };

    recorder = {
      type = "noctalia/screen_recorder:recorder";
    };

    cat = {
      audio_spectrum = true;
      tappy_mode = true;
      type = "noctalia/bongocat:cat";
      use_mpris_filter = true;
    };

    launcher = {
      glyph = "niri";
      custom_image = pkgs.fetchurl {
        url = "https://upload.wikimedia.org/wikipedia/commons/3/35/Nix_Snowflake_Logo.svg";
        hash = "sha256-SCuQlSPB14GFTq4XvExJ0QEuK2VIbrd5YYKHLRG/q5I=";
      };
      custom_image_colorize = true;
    };

    media = {
      max_length = 150;
      title_scroll = "on_hover";
    };

    mpvpaper = {
      type = "noctalia/mpvpaper:mpvpaper";
    };

    widget = {
      type = "oldirtty/color_picker:widget";
    };

    mirror = {
      type = "elijaharch/wl-screen-mirror:mirror";
    };

    toggle = {
      type = "cleboost/hotspot:toggle";
    };
  };

  battery = {
    warning_threshold = 20;
  };

  plugin_settings = {
    "noctalia/mpvpaper" = {
      video_directory = "/home/sunny/Pictures/walls/videos";
    };

    "oldirtty/color_picker" = {
      hyprpicker-lowercase = true;
    };
  };

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
}
