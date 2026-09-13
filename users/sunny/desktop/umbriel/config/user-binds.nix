{
  keybinds = {
    "Print" = "spawn:umbriel-screenshot region --freeze";
    "Ctrl+Print" = "spawn:umbriel-screenshot full";
    "Alt+Print" = "spawn:umbriel-screenshot window";
    "Mod+Print" = "spawn:wl-paste --type image | satty --filename -";

    "Super+Shift+S" = "spawn:umbriel-screenshot region --freeze";
    "Ctrl+Super+Shift+S" = "spawn:umbriel-screenshot full";
    "Alt+Super+Shift+S" = "spawn:umbriel-screenshot window";
    "Ctrl+Alt+Super+Shift+S" = "spawn:wl-paste --type image | satty --filename -";

    "Ctrl+Alt+Delete" = "session-quit";
    "Mod+Q" = {
      action = "window-close";
      repeat = false;
    };
    "Mod+Space" = {
      action = "overview-toggle";
      repeat = false;
    };
    "Mod+Shift+Slash" = "cheatsheet-open";

    "Mod+T" = "spawn:foot";

    "Mod+A" = "spawn:noctalia msg panel-toggle launcher";
    "Mod+Escape" = "spawn:noctalia msg panel-toggle session";
    "Mod+V" = "spawn:noctalia msg panel-toggle clipboard";
    "XF86Calculator" = "spawn:noctalia msg panel-toggle control-center calendar";
    "XF86Favorites" = "spawn:noctalia msg panel-toggle launcher /emo";
    "XF86Launch5" = "spawn:noctalia msg session lock";
    "XF86Launch6" = "spawn:noctalia msg window-switcher";
    "XF86PowerOff" = "spawn:noctalia msg session lock-and-suspend";
    "XF86Tools" = "spawn:noctalia msg settings-toggle";
    "XF86AudioLowerVolume" = {
      action = "spawn:noctalia msg volume-down 5";
      allow_when_locked = true;
    };
    "XF86AudioMicMute" = {
      action = "spawn:noctalia msg mic-mute";
      allow_when_locked = true;
    };
    "XF86AudioMute" = {
      action = "spawn:noctalia msg volume-mute";
      allow_when_locked = true;
    };
    "XF86AudioNext" = {
      action = "spawn:noctalia msg media next";
      allow_when_locked = true;
    };
    "XF86AudioPlay" = {
      action = "spawn:noctalia msg media toggle";
      allow_when_locked = true;
    };
    "XF86AudioPrev" = {
      action = "spawn:noctalia msg media previous";
      allow_when_locked = true;
    };
    "XF86AudioRaiseVolume" = {
      action = "spawn:noctalia msg volume-up 5";
      allow_when_locked = true;
    };
    "XF86MonBrightnessDown" = {
      action = "spawn:noctalia msg brightness-down 5";
      allow_when_locked = true;
    };
    "XF86MonBrightnessUp" = {
      action = "spawn:noctalia msg brightness-up 5";
      allow_when_locked = true;
    };
  };
}
