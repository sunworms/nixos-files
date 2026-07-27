{
  workspace = [
    {_args = ["work"];}
    {_args = ["fun"];}
  ];

  input = {
    keyboard = {
      xkb = {};
      numlock = [];
    };

    touchpad = {
      tap = [];
      natural-scroll = [];
    };

    disable-power-key-handling = [];
  };

  layout = {
    background-color = "transparent";
    gaps = 10;
    center-focused-column = "never";

    preset-column-widths._children = [
      {proportion = 0.5;}
      {proportion = 0.75;}
      {proportion = 1.0;}
    ];

    default-column-width = {
      proportion = 1.0;
    };

    focus-ring = {
      width = 2;
    };

    border = {
      off = [];
      width = 2;
    };

    shadow = {
      softness = 30;
      spread = 5;
      offset._props = {
        x = 0;
        y = 5;
      };
    };

    struts = {
      left = 10;
      right = 10;
    };
  };

  blur = {
    passes = 3;
    offset = 3;
    noise = 0.02;
    saturation = 1.5;
  };

  spawn-sh-at-startup = "niri-float-sticky -title 'Picture-in-Picture|Picture in picture'";

  spawn-at-startup = [
    {_args = ["noctalia" "--daemon"];}
    {_args = ["sh" "-c" "sleep 1 && xrdb -merge ~/.Xresources"];}
    {_args = ["apply-gtk-settings"];}
  ];

  hotkey-overlay = {
    skip-at-startup = [];
  };

  screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

  cursor = {
    xcursor-theme = "volantes_cursors";
    xcursor-size = 24;
  };

  environment = {
    NIXOS_OZONE_WL = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    EDITOR = "nvim";
    SUDO_EDITOR = "nvim";
    VISUAL = "nvim";
    TERMINAL = "foot";
    GTK_THEME = "adw-gtk3";
    QT_QPA_PLATFORMTHEME = "gtk3";
  };

  animations = {};

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
      default-column-width = {
        fixed = 525;
      };
      default-window-height = {
        fixed = 295;
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

  layer-rule = {
    match = [
      {_props.namespace = "^noctalia-wallpaper*";}
      {_props.namespace = "^mpvpaper$";}
    ];
    place-within-backdrop = true;
  };

  switch-events = {
    lid-close = {
      spawn = ["noctalia" "msg" "session" "lock-and-suspend"];
    };
  };

  prefer-no-csd = [];

  recent-windows = {
    binds = {
      "Alt+Tab" = {
        next-window = [];
      };
      "Alt+Shift+Tab" = {
        previous-window = [];
      };
      "Mod+Tab" = {
        next-window = [];
      };
      "Mod+Shift+Tab" = {
        previous-window = [];
      };
    };
  };

  binds = {
    "Mod+Shift+Slash" = {
      show-hotkey-overlay = [];
    };
    "Mod+T" = {
      _props = {
        hotkey-overlay-title = "Open a Terminal: foot";
      };
      spawn = "foot";
    };
    "Mod+Shift+T" = {
      _props = {
        hotkey-overlay-title = "Layers";
      };
      spawn = ["foot" "sh" "-c" "niri msg layers; fish"];
    };
    "Mod+A" = {
      _props = {
        hotkey-overlay-title = "Application Launcher";
      };
      spawn = ["noctalia" "msg" "panel-toggle" "launcher"];
    };
    "Mod+V" = {
      _props = {
        hotkey-overlay-title = "Clipboard";
      };
      spawn = ["noctalia" "msg" "panel-toggle" "clipboard"];
    };
    "Mod+Escape" = {
      _props = {
        hotkey-overlay-title = "Power Menu";
      };
      spawn = ["noctalia" "msg" "panel-toggle" "session"];
    };
    "XF86Tools" = {
      _props = {
        hotkey-overlay-title = "Noctalia Settings";
      };
      spawn = ["noctalia" "msg" "settings-toggle"];
    };
    "XF86Launch5" = {
      _props = {
        hotkey-overlay-title = "Lock the Screen";
      };
      spawn = ["noctalia" "msg" "session" "lock"];
    };
    "XF86Launch6" = {
      _props = {
        hotkey-overlay-title = "Window Switcher";
      };
      spawn = ["noctalia" "msg" "window-switcher"];
    };
    "XF86Calculator" = {
      _props = {
        hotkey-overlay-title = "Open Calendar";
      };
      spawn = ["noctalia" "msg" "panel-toggle" "control-center" "calendar"];
    };
    "XF86Favorites" = {
      _props = {
        hotkey-overlay-title = "Emoji Selector";
      };
      spawn = ["noctalia" "msg" "panel-toggle" "launcher" "/emo"];
    };
    "XF86PowerOff" = {
      _props = {
        hotkey-overlay-title = "Lock and Suspend";
      };
      spawn = ["noctalia" "msg" "session" "lock-and-suspend"];
    };
    "XF86AudioRaiseVolume" = {
      _props = {
        allow-when-locked = true;
      };
      spawn = ["noctalia" "msg" "volume-up" "5"];
    };
    "XF86AudioLowerVolume" = {
      _props = {
        allow-when-locked = true;
      };
      spawn = ["noctalia" "msg" "volume-down" "5"];
    };
    "XF86AudioMute" = {
      _props = {
        allow-when-locked = true;
      };
      spawn = ["noctalia" "msg" "volume-mute"];
    };
    "XF86AudioMicMute" = {
      _props = {
        allow-when-locked = true;
      };
      spawn = ["noctalia" "msg" "mic-mute"];
    };
    "XF86MonBrightnessUp" = {
      _props = {
        allow-when-locked = true;
      };
      spawn = ["noctalia" "msg" "brightness-up" "5"];
    };
    "XF86MonBrightnessDown" = {
      _props = {
        allow-when-locked = true;
      };
      spawn = ["noctalia" "msg" "brightness-down" "5"];
    };
    "XF86AudioPlay" = {
      _props = {
        allow-when-locked = true;
      };
      spawn = ["noctalia" "msg" "media" "toggle"];
    };
    "XF86AudioPrev" = {
      _props = {
        allow-when-locked = true;
      };
      spawn = ["noctalia" "msg" "media" "previous"];
    };
    "XF86AudioNext" = {
      _props = {
        allow-when-locked = true;
      };
      spawn = ["noctalia" "msg" "media" "next"];
    };
    "Mod+Space" = {
      _props = {
        repeat = false;
      };
      toggle-overview = [];
    };
    "Mod+Q" = {
      _props = {
        repeat = false;
      };
      close-window = [];
    };
    "Mod+Left" = {
      focus-column-left = [];
    };
    "Mod+Down" = {
      focus-window-down = [];
    };
    "Mod+Up" = {
      focus-window-up = [];
    };
    "Mod+Right" = {
      focus-column-right = [];
    };
    "Mod+H" = {
      focus-column-left = [];
    };
    "Mod+L" = {
      focus-column-right = [];
    };
    "Mod+Ctrl+Left" = {
      move-column-left = [];
    };
    "Mod+Ctrl+Down" = {
      move-window-down = [];
    };
    "Mod+Ctrl+Up" = {
      move-window-up = [];
    };
    "Mod+Ctrl+Right" = {
      move-column-right = [];
    };
    "Mod+Ctrl+H" = {
      move-column-left = [];
    };
    "Mod+Ctrl+L" = {
      move-column-right = [];
    };
    "Mod+J" = {
      focus-window-or-workspace-down = [];
    };
    "Mod+K" = {
      focus-window-or-workspace-up = [];
    };
    "Mod+Ctrl+J" = {
      move-window-down-or-to-workspace-down = [];
    };
    "Mod+Ctrl+K" = {
      move-window-up-or-to-workspace-up = [];
    };
    "Mod+Home" = {
      focus-column-first = [];
    };
    "Mod+End" = {
      focus-column-last = [];
    };
    "Mod+Ctrl+Home" = {
      move-column-to-first = [];
    };
    "Mod+Ctrl+End" = {
      move-column-to-last = [];
    };
    "Mod+Shift+Left" = {
      focus-monitor-left = [];
    };
    "Mod+Shift+Down" = {
      focus-monitor-down = [];
    };
    "Mod+Shift+Up" = {
      focus-monitor-up = [];
    };
    "Mod+Shift+Right" = {
      focus-monitor-right = [];
    };
    "Mod+Shift+H" = {
      focus-monitor-left = [];
    };
    "Mod+Shift+J" = {
      focus-monitor-down = [];
    };
    "Mod+Shift+K" = {
      focus-monitor-up = [];
    };
    "Mod+Shift+L" = {
      focus-monitor-right = [];
    };
    "Mod+Shift+Ctrl+Left" = {
      move-column-to-monitor-left = [];
    };
    "Mod+Shift+Ctrl+Down" = {
      move-column-to-monitor-down = [];
    };
    "Mod+Shift+Ctrl+Up" = {
      move-column-to-monitor-up = [];
    };
    "Mod+Shift+Ctrl+Right" = {
      move-column-to-monitor-right = [];
    };
    "Mod+Shift+Ctrl+H" = {
      move-column-to-monitor-left = [];
    };
    "Mod+Shift+Ctrl+J" = {
      move-column-to-monitor-down = [];
    };
    "Mod+Shift+Ctrl+K" = {
      move-column-to-monitor-up = [];
    };
    "Mod+Shift+Ctrl+L" = {
      move-column-to-monitor-right = [];
    };
    "Mod+Page_Down" = {
      focus-workspace-down = [];
    };
    "Mod+Page_Up" = {
      focus-workspace-up = [];
    };
    "Mod+U" = {
      focus-workspace-down = [];
    };
    "Mod+I" = {
      focus-workspace-up = [];
    };
    "Mod+Ctrl+Page_Down" = {
      move-column-to-workspace-down = [];
    };
    "Mod+Ctrl+Page_Up" = {
      move-column-to-workspace-up = [];
    };
    "Mod+Ctrl+U" = {
      move-column-to-workspace-down = [];
    };
    "Mod+Ctrl+I" = {
      move-column-to-workspace-up = [];
    };
    "Mod+Shift+Page_Down" = {
      move-workspace-down = [];
    };
    "Mod+Shift+Page_Up" = {
      move-workspace-up = [];
    };
    "Mod+Shift+U" = {
      move-workspace-down = [];
    };
    "Mod+Shift+I" = {
      move-workspace-up = [];
    };
    "Mod+WheelScrollDown" = {
      _props = {
        cooldown-ms = 150;
      };
      focus-workspace-down = [];
    };
    "Mod+WheelScrollUp" = {
      _props = {
        cooldown-ms = 150;
      };
      focus-workspace-up = [];
    };
    "Mod+Ctrl+WheelScrollDown" = {
      _props = {
        cooldown-ms = 150;
      };
      move-column-to-workspace-down = [];
    };
    "Mod+Ctrl+WheelScrollUp" = {
      _props = {
        cooldown-ms = 150;
      };
      move-column-to-workspace-up = [];
    };
    "Mod+WheelScrollRight" = {
      focus-column-right = [];
    };
    "Mod+WheelScrollLeft" = {
      focus-column-left = [];
    };
    "Mod+Ctrl+WheelScrollRight" = {
      move-column-right = [];
    };
    "Mod+Ctrl+WheelScrollLeft" = {
      move-column-left = [];
    };
    "Mod+Shift+WheelScrollDown" = {
      focus-column-right = [];
    };
    "Mod+Shift+WheelScrollUp" = {
      focus-column-left = [];
    };
    "Mod+Ctrl+Shift+WheelScrollDown" = {
      move-column-right = [];
    };
    "Mod+Ctrl+Shift+WheelScrollUp" = {
      move-column-left = [];
    };
    "Mod+1" = {
      focus-workspace = 1;
    };
    "Mod+2" = {
      focus-workspace = 2;
    };
    "Mod+3" = {
      focus-workspace = 3;
    };
    "Mod+4" = {
      focus-workspace = 4;
    };
    "Mod+5" = {
      focus-workspace = 5;
    };
    "Mod+6" = {
      focus-workspace = 6;
    };
    "Mod+7" = {
      focus-workspace = 7;
    };
    "Mod+8" = {
      focus-workspace = 8;
    };
    "Mod+9" = {
      focus-workspace = 9;
    };
    "Mod+0" = {
      focus-workspace = 10;
    };
    "Mod+Ctrl+1" = {
      move-column-to-workspace = 1;
    };
    "Mod+Ctrl+2" = {
      move-column-to-workspace = 2;
    };
    "Mod+Ctrl+3" = {
      move-column-to-workspace = 3;
    };
    "Mod+Ctrl+4" = {
      move-column-to-workspace = 4;
    };
    "Mod+Ctrl+5" = {
      move-column-to-workspace = 5;
    };
    "Mod+Ctrl+6" = {
      move-column-to-workspace = 6;
    };
    "Mod+Ctrl+7" = {
      move-column-to-workspace = 7;
    };
    "Mod+Ctrl+8" = {
      move-column-to-workspace = 8;
    };
    "Mod+Ctrl+9" = {
      move-column-to-workspace = 9;
    };
    "Mod+Ctrl+0" = {
      move-column-to-workspace = 10;
    };
    "Mod+BracketLeft" = {
      consume-or-expel-window-left = [];
    };
    "Mod+BracketRight" = {
      consume-or-expel-window-right = [];
    };
    "Mod+Comma" = {
      consume-window-into-column = [];
    };
    "Mod+Period" = {
      expel-window-from-column = [];
    };
    "Mod+R" = {
      switch-preset-column-width = [];
    };
    "Mod+Shift+R" = {
      switch-preset-window-height = [];
    };
    "Mod+Ctrl+R" = {
      reset-window-height = [];
    };
    "Mod+F" = {
      maximize-column = [];
    };
    "Mod+Shift+F" = {
      fullscreen-window = [];
    };
    "Mod+M" = {
      maximize-window-to-edges = [];
    };
    "Mod+Ctrl+F" = {
      expand-column-to-available-width = [];
    };
    "Mod+C" = {
      center-column = [];
    };
    "Mod+Ctrl+C" = {
      center-visible-columns = [];
    };
    "Mod+Minus" = {
      set-column-width = "-5%";
    };
    "Mod+Equal" = {
      set-column-width = "+5%";
    };
    "Mod+Shift+Minus" = {
      set-window-height = "-5%";
    };
    "Mod+Shift+Equal" = {
      set-window-height = "+5%";
    };
    "Mod+Alt+V" = {
      toggle-window-floating = [];
    };
    "Mod+Shift+V" = {
      switch-focus-between-floating-and-tiling = [];
    };
    "Mod+W" = {
      toggle-column-tabbed-display = [];
    };
    "Print" = {
      screenshot = [];
    };
    "Ctrl+Print" = {
      screenshot-screen = [];
    };
    "Alt+Print" = {
      screenshot-window = [];
    };
    "Mod+Print" = {
      spawn-sh = "wl-paste --type image | satty --filename -";
    };
    "Super+Shift+S" = {
      screenshot = [];
    };
    "Ctrl+Super+Shift+S" = {
      screenshot-screen = [];
    };
    "Alt+Super+Shift+S" = {
      screenshot-window = [];
    };
    "Ctrl+Alt+Super+Shift+S" = {
      spawn-sh = "wl-paste --type image | satty --filename -";
    };
    "Mod+Shift+Escape" = {
      _props = {
        allow-inhibiting = false;
      };
      toggle-keyboard-shortcuts-inhibit = [];
    };
    "Ctrl+Alt+Delete" = {
      quit = [];
    };
    "Mod+Shift+P" = {
      power-off-monitors = [];
    };
  };

  gestures = {
    hot-corners = {
      off = [];
    };
  };

  overview = {
    zoom = 0.15;
    workspace-shadow = {
      off = [];
    };
  };

  include = {
    _args = ["noctalia.kdl"];
    _props.optional = true;
  };
}
