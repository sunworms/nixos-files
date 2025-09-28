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

  files = {
    ".gtkrc-2.0".text = ''
    gtk-cursor-theme-name = "Vimix Cursors"
    gtk-cursor-theme-size = 24
    gtk-icon-theme-name = "Tela-circle-black-dark"
    gtk-theme-name = "Materia-dark"
    '';

    ".config/gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-cursor-theme-name=Vimix Cursors
    gtk-cursor-theme-size=24
    gtk-icon-theme-name=Tela-circle-black-dark
    gtk-theme-name=Materia-dark
    '';

    ".config/gtk-4.0/settings.ini".text = ''
    [Settings]
    gtk-cursor-theme-name=Vimix Cursors
    gtk-cursor-theme-size=24
    gtk-icon-theme-name=Tela-circle-black-dark
    gtk-theme-name=Materia-dark
    '';

    ".config/gtk-4.0/assets".source = "${pkgs.materia-theme}/share/themes/Materia-dark/gtk-4.0/assets";
    ".config/gtk-4.0/gtk.css".source = "${pkgs.materia-theme}/share/themes/Materia-dark/gtk-4.0/gtk.css";
    ".config/gtk-4.0/gtk-dark.css".source = "${pkgs.materia-theme}/share/themes/Materia-dark/gtk-4.0/gtk-dark.css";

    ".config/Kvantum/MateriaDark".source = "${pkgs.materia-kde-theme}/share/Kvantum/MateriaDark";
    ".config/Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=MateriaDark
    '';
  };
}
