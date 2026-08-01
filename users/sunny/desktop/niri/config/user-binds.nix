{
  binds = {
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
    "Print".screenshot = [];
    "Ctrl+Print".screenshot-screen = [];
    "Alt+Print".screenshot-window = [];
    "Mod+Print".spawn-sh = "wl-paste --type image | satty --fullscreen --filename -";
    "Super+Shift+S".screenshot = [];
    "Ctrl+Super+Shift+S".screenshot-screen = [];
    "Alt+Super+Shift+S".screenshot-window = [];
    "Ctrl+Alt+Super+Shift+S".spawn-sh = "wl-paste --type image | satty --fullscreen --filename -";
    "Mod+Shift+Escape" = {
      _props = {
        allow-inhibiting = false;
      };
      toggle-keyboard-shortcuts-inhibit = [];
    };
    "Ctrl+Alt+Delete".quit = [];
    "Mod+Shift+P". power-off-monitors = [];
  };
}
