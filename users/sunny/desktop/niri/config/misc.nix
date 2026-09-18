{
  include = {
    _args = ["noctalia.kdl"];
    _props.optional = true;
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

  blur = {
    passes = 3;
    offset = 3;
    noise = 0.02;
    saturation = 1.5;
  };

  hotkey-overlay = {
    skip-at-startup = [];
  };

  screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

  animations = {};

  switch-events = {
    lid-close = {
      spawn = ["noctalia" "msg" "session" "lock-and-suspend"];
    };
  };

  prefer-no-csd = [];

  recent-windows = {
    binds = {
      "Alt+Tab".next-window = [];
      "Alt+Shift+Tab".previous-window = [];
      "Mod+Tab".next-window = [];
      "Mod+Shift+Tab".previous-window = [];
    };
  };
}
