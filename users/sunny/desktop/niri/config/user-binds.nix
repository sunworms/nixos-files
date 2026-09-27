{
  binds = {
    "Mod+T" = {
      _props = {
        hotkey-overlay-title = "Open a Terminal: kitty";
        repeat = false;
      };
      spawn = "kitty";
    };
    "Mod+A" = {
      _props = {
        hotkey-overlay-title = "Application Launcher";
      };
      spawn = ["fuzzel"];
    };
    "Mod+V" = {
      _props = {
        hotkey-overlay-title = "Clipboard";
      };
      spawn = ["copyq" "toggle"];
    };
    "Mod+Escape" = {
      _props = {
        hotkey-overlay-title = "Power Menu";
      };
      spawn = ["fuzzel-logout-menu"];
    };
    "XF86Launch5" = {
      _props = {
        hotkey-overlay-title = "Lock the Screen";
      };
      spawn = ["gtklock"];
    };
    "XF86Launch6" = {
      _props = {
        hotkey-overlay-title = "Window Switcher";
      };
      spawn = ["niri-window-switcher"];
    };
    "XF86Favorites" = {
      _props = {
        hotkey-overlay-title = "Emoji Selector";
      };
      spawn = ["rofimoji" "-a" "copy"];
    };
    "XF86AudioRaiseVolume" = {
      _props = {
        allow-when-locked = true;
      };
      spawn = ["volume-osd" "up"];
    };
    "XF86AudioLowerVolume" = {
      _props = {
        allow-when-locked = true;
      };
      spawn = ["volume-osd" "down"];
    };
    "XF86AudioMute" = {
      _props = {
        allow-when-locked = true;
      };
      spawn = ["volume-osd" "mute"];
    };
    "XF86AudioMicMute" = {
      _props = {
        allow-when-locked = true;
      };
      spawn = ["wpctl" "set-mute" "@DEFAULT_SOURCE@" "toggle"];
    };
    "XF86MonBrightnessUp" = {
      _props = {
        allow-when-locked = true;
      };
      spawn = ["bright-osd" "up"];
    };
    "XF86MonBrightnessDown" = {
      _props = {
        allow-when-locked = true;
      };
      spawn = ["bright-osd" "down"];
    };
    "XF86AudioPlay" = {
      _props = {
        allow-when-locked = true;
      };
      spawn = ["playerctl" "play-pause"];
    };
    "XF86AudioStop" = {
      _props = {
        allow-when-locked = true;
      };
      spawn = ["playerctl" "stop"];
    };
    "XF86AudioPrev" = {
      _props = {
        allow-when-locked = true;
      };
      spawn = ["playerctl" "previous"];
    };
    "XF86AudioNext" = {
      _props = {
        allow-when-locked = true;
      };
      spawn = ["playerctl" "next"];
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
