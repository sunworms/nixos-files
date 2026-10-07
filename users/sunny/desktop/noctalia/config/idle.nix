{
  idle = {
    behavior_order = ["idle-behavior" "idle-behavior-2"];

    behavior = {
      idle-behavior = {
        action = "lock";
        enabled = true;
        timeout = 300;
      };

      idle-behavior-2 = {
        action = "screen_off";
        enabled = true;
        timeout = 600;
      };
    };
  };
}
