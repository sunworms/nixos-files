{
  "$schema" = "/etc/xdg/swaync/configSchema.json";
  timeout = 5;
  timeout-low = 5;
  timeout-critical = 0;
  notification-visibility = {
    osd = {
      app-name = "^osd$";
      state = "transient";
      override-urgency = "low";
    };
  };
  hide-on-action = true;
  notification-grouping = true;
}
