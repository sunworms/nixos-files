{
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

  dock = {
    auto_hide = true;
    background_opacity = 1.0;
    enabled = false;
    position = "top";
  };

  location = {
    auto_locate = false;
  };

  accessibility = {
    ui_scale = 1.0;
  };

  notification = {
    background_opacity = 1.0;
    scale = 1.0;
  };

  osd = {
    background_opacity = 1.0;
    scale = 1.0;
  };

  battery = {
    warning_threshold = 20;
  };

  hooks.started = ''
    /usr/bin/env gdbus call \
      --session \
      --dest org.freedesktop.portal.Desktop \
      --object-path /org/freedesktop/portal/desktop \
      --method org.freedesktop.portal.Settings.Read \
      org.freedesktop.appearance \
      color-scheme
  '';
}
