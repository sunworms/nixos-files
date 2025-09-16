{ config, lib, pkgs, ... }:

{
  imports = [
    ./catppuccin.nix
    ./kvantum.nix
  ];

  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-mocha-lavender-compact";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        size = "compact";
        variant = "mocha";
      };
    };
    iconTheme = lib.mkForce({
      name = "Tela-circle-dracula-dark";
      package = pkgs.tela-circle-icon-theme.override {
        colorVariants = [ "dracula" ];
      };
    });
    cursorTheme = {
      name = "Catppuccin Mocha Dark";
      package = pkgs.catppuccin-cursors.mochaDark;
      size = 24;
    };
  };

  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

}
