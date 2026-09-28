{
  config,
  lib,
  pkgs,
  ...
}: let
  catppuccin-mocha-lavender-gtk = pkgs.catppuccin-gtk.override {
    accents = ["lavender"];
    variant = "mocha";
  };

  catppuccin-mocha-lavender-kvantum = pkgs.catppuccin-kvantum.override {
    accent = "lavender";
    variant = "mocha";
  };

  qtctFiles = builtins.listToAttrs (
    map
    (qt: {
      name = "${qt}ct/${qt}ct.conf";
      value.text =
        #ini
        ''
          [Appearance]
          custom_palette=true
          icon_theme=Adwaita
          standard_dialogs=xdgdesktopportal
          style=kvantum
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
      value.text =
        #ini
        ''
          [Settings]
          gtk-theme-name=catppuccin-mocha-lavender-standard
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
      "gtk-4.0/gtk.css".text =
        #css
        ''
          @import url("file://${catppuccin-mocha-lavender-gtk}/share/themes/catppuccin-mocha-lavender-standard/gtk-4.0/gtk.css");
        '';
      "Kvantum/kvantum.kvconfig".text =
        #ini
        ''
          [General]
          theme=catppuccin-mocha-lavender
        '';
      "Kvantum/catppuccin-mocha-lavender".source = "${catppuccin-mocha-lavender-kvantum}/share/Kvantum/catppuccin-mocha-lavender";
    }
    // qtctFiles
    // gtkFiles;

  files = {
    ".icons/default/index.theme".text =
      #ini
      ''
        [Icon Theme]
        Name=Default
        Comment=Default Cursor Theme
        Inherits=Adwaita
      '';
  };

  packages = with pkgs; [
    catppuccin-mocha-lavender-gtk
    catppuccin-mocha-lavender-kvantum
    volantes-cursors
    adwaita-icon-theme
    libsForQt5.qt5ct
    qt6Packages.qt6ct
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
  ];

  systemd.services.set-gtk-settings = {
    description = "Set GTK settings via dconf";
    wantedBy = ["graphical-session.target"];
    environment = {
      PATH = lib.mkForce null;
    };
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${
        pkgs.writeShellScript "set-gtk-settings" ''
          /usr/bin/env dconf write /org/gnome/desktop/interface/font-name "'${config.fonts.sansSerif} 11'"
          /usr/bin/env dconf write /org/gnome/desktop/interface/cursor-theme "'volantes_cursors'"
          /usr/bin/env dconf write /org/gnome/desktop/interface/icon-theme "'Adwaita'"
          /usr/bin/env dconf write /org/gnome/desktop/interface/gtk-theme "'catppuccin-mocha-lavender-standard'"
        ''
      }";
    };
  };
}
