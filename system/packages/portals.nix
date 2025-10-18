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
        "org.freedesktop.impl.portal.Secret" = [
          "gnome-keyring"
        ];
      };
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };
}
