{
  config,
  lib,
  pkgs,
  ...
}: let
  qtctFiles = builtins.listToAttrs (
    map
    (qt: {
      name = "${qt}ct/${qt}ct.conf";
      value.text = ''
        [Appearance]
        color_scheme_path=/home/sunny/.config/${qt}ct/colors/noctalia.conf
        custom_palette=true
        icon_theme=Adwaita
        standard_dialogs=xdgdesktopportal
        style=Fusion
      '';
    })
    [
      "qt5"
      "qt6"
    ]
  );
  gtkFiles = builtins.listToAttrs (
    map
    (gtk: {
      name = "${gtk}/settings.ini";
      value.text = ''
        [Settings]
        gtk-theme-name=adw-gtk3
        gtk-icon-theme-name=Adwaita
        gtk-font-name=${config.fonts.sansSerif} 11
        gtk-cursor-theme-name=volantes_cursors
        gtk-cursor-theme-size=24
        gtk-application-prefer-dark-theme=1
      '';
    })
    [
      "gtk-3.0"
      "gtk-4.0"
    ]
  );
in {
  xdg.config.files =
    {
      "kdeglobals".text = ''
        [UiSettings]
        ColorScheme=noctalia
      '';
      "okular.kmessagebox".text = ''
        [General]
        presentationInfo=4
      '';

      "gtk-3.0/gtk.css".text = ''
        @import url("noctalia.css");
      '';

      "gtk-4.0/gtk.css".text = ''
        @import url("file://${pkgs.adw-gtk3}/share/themes/adw-gtk3/gtk-4.0/gtk.css");
        @import url("noctalia.css");
      '';
    }
    // qtctFiles
    // gtkFiles;

  files = {
    ".icons/default/index.theme".text = ''
      [Icon Theme]
      Name=Default
      Comment=Default Cursor Theme
      Inherits=volantes_cursors
    '';
  };

  packages = with pkgs; [
    adw-gtk3
    volantes-cursors
    adwaita-icon-theme
    libsForQt5.qt5ct
    qt6Packages.qt6ct
  ];

  systemd.services.set-gtk-settings = {
    description = "Set GTK settings via dconf";
    wantedBy = ["graphical-session.target"];
    environment = {
      PATH = lib.mkForce null;
    };
    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''
        /usr/bin/env dconf write /org/gnome/desktop/interface/font-name \"'${config.fonts.sansSerif} 11'\"
        /usr/bin/env dconf write /org/gnome/desktop/interface/cursor-theme-name \"'volantes_cursors'\"
        /usr/bin/env dconf write /org/gnome/desktop/interface/icon-theme-name \"'Adwaita'\"
        /usr/bin/env dconf write /org/gnome/desktop/interface/theme-name \"'adw-gtk3'\"
      '';
    };
  };
}
