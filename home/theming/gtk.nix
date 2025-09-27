{ config, lib, pkgs, ... }:

{
  imports = [
    ./kvantum.nix
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Materia-dark";
      package = pkgs.materia-theme;
    };
    iconTheme = lib.mkForce({
      name = "Tela-circle-black-dark";
      package = pkgs.tela-circle-icon-theme.override {
        colorVariants = [ "black" ];
      };
    });
    cursorTheme = {
      name = "Vimix Cursors";
      package = pkgs.vimix-cursors;
      size = 24;
    };
  };

  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

}
