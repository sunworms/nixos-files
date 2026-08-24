{
  keybinds = {
    "Ctrl+Print" = "spawn:noctalia msg screenshot-fullscreen all";
    "Ctrl+Super+Shift+S" = "spawn:noctalia msg screenshot-fullscreen all";
    "Print" = "spawn:noctalia msg screenshot-region";
    "Super+Shift+S" = "spawn:noctalia msg screenshot-region";

    "Ctrl+Alt+Delete" = "session-quit";
    "Ctrl+Alt+Super+Shift+S" = "spawn:wl-paste --type image | satty --filename -";
    "Mod+Q" = {
      action = "window-close";
      repeat = false;
    };
    "Mod+Space" = {
      action = "overview-toggle";
      repeat = false;
    };
    "Mod+Shift+Slash" = "cheatsheet-open";
    "Mod+Shift+T" = "spawn:foot sh -c \"umbriel layers; fish\"";

    "Mod+T" = "spawn:foot";
  };
}
