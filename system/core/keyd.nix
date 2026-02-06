{ ... }:

{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            shift = "oneshot(shift)";
            meta = "oneshot(meta)";
            control = "oneshot(control)";
            leftalt = "oneshot(alt)";
            rightalt = "oneshot(altgr)";
            capslock = "overload(control, esc)";
            esc = "capslock";
          };
        };
      };
    };
  };
}
