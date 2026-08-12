{pkgs}: {
  widget = {
    audio_visualizer = {
      centered = false;
      color_2 = "secondary";
    };

    clock = {
      format = "{:%a, %d %b %Y, %H:%M}";
      tooltip_format = "{:%a, %d %b %Y, %H:%M:%S}";
      vertical_format = "{:%d\\n%m\\n%y\\n-\\n%H\\n%M}";
    };

    taskbar = {
      capsule = true;
      group_by_workspace = true;
      hide_empty_workspaces = false;
    };

    network = {
      show_label = false;
    };

    workspaces = {
      display = "none";
      hide_when_empty = false;
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
      display = "gauge";
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
        url = "https://upload.wikimedia.org/wikipedia/commons/2/28/Nix_snowflake.svg";
        hash = "sha256-SCuQlSPB14GFTq4XvExJ0QEuK2VIbrd5YYKHLRG/q5I=";
      };
      custom_image_colorize = true;
    };

    media = {
      max_length = 150;
      title_scroll = "on_hover";
      album_art_only = true;
    };

    mpvpaper = {
      type = "noctalia/mpvpaper:mpvpaper";
    };

    widget = {
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
