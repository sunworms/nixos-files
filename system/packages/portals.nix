{ pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = [
          "gtk"
          "wlr"
        ];
        "org.freedesktop.impl.portal.FileChooser" = [
          "gtk"
        ];
        "org.freedesktop.impl.portal.ScreenCast" = [
          "wlr"
        ];
      };
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };
}
