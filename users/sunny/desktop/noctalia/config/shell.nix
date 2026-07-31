{
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
}
