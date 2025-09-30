{ config, lib, pkgs, ... }:

{
  packages = with pkgs; [
    materia-theme
    vimix-cursors
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qt6ct
    materia-kde-theme
    (tela-circle-icon-theme.override {
      colorVariants = [ "black" ];
    })
  ];

  dconf.settings = {
    "/org/gnome/desktop/interface/color-scheme" = "prefer-dark";
    "/org/gnome/desktop/interface/cursor-theme" = "Vimix Cursors";
    "/org/gnome/desktop/interface/cursor-size" = 24;
    "/org/gnome/desktop/interface/gtk-theme" = "Materia-dark";
    "/org/gnome/desktop/interface/icon-theme" = "Tela-circle-black-dark";
  };

  gsettings.settings = {
    org = {
      gnome = {
        desktop = {
          interface = {
            color-scheme = "prefer-dark";
            icon-theme = "Tela-circle-black-dark";
            gtk-theme = "Materia-dark";
            cursor-theme = "Vimix Cursors";
            cursor-size = 24;
          };
        };
      };
      cinnamon.desktop.default-applications.terminal = "exec kitty";
    };
  };

  file.home.".gtkrc-2.0".text = ''
    gtk-cursor-theme-name = "Vimix Cursors"
    gtk-cursor-theme-size = 24
    gtk-icon-theme-name = "Tela-circle-black-dark"
    gtk-theme-name = "Materia-dark"
    '';

  file.xdg_config = {
    "gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-cursor-theme-name=Vimix Cursors
    gtk-cursor-theme-size=24
    gtk-icon-theme-name=Tela-circle-black-dark
    gtk-theme-name=Materia-dark
    '';

    "gtk-4.0/settings.ini".text = ''
    [Settings]
    gtk-cursor-theme-name=Vimix Cursors
    gtk-cursor-theme-size=24
    gtk-icon-theme-name=Tela-circle-black-dark
    gtk-theme-name=Materia-dark
    '';

    "gtk-4.0/assets".source = "${pkgs.materia-theme}/share/themes/Materia-dark/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${pkgs.materia-theme}/share/themes/Materia-dark/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${pkgs.materia-theme}/share/themes/Materia-dark/gtk-4.0/gtk-dark.css";

    "Kvantum/MateriaDark".source = "${pkgs.materia-kde-theme}/share/Kvantum/MateriaDark";
    "Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=MateriaDark
    '';
  };
}
