{pkgs}: {
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
      show_labels = false;
    };

    cpu = {
      visualization = "gauge";
      show_value = false;
      type = "sysmon";
    };

    ram = {
      visualization = "gauge";
      show_value = false;
      stat = "ram_used";
      type = "sysmon";
    };

    temp = {
      show_value = false;
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
        url = "https://upload.wikimedia.org/wikipedia/commons/2/28/Nix_snowflake.svg";
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

    widget_2 = {
      type = "alexander/screen-toolkit:widget";
    };

    mirror = {
      type = "elijaharch/wl-screen-mirror:mirror";
    };

    toggle = {
      type = "cleboost/hotspot:toggle";
    };
  };
}
