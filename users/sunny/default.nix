{ pkgs, ... }:

{
  imports = [
    ./packages
    ./desktop
    ./browser.nix
  ];

  directory = "/home/sunny";

  packages = with pkgs; [
    # fish plugins
    fishPlugins.tide
    fishPlugins.git-abbr

    # theming
    adw-gtk3
    volantes-cursors
    candy-icons
    libsForQt5.qt5ct
    kdePackages.qt6ct
    (writeShellScriptBin "apply-gtk-settings" ''
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/gtk-theme "'adw-gtk3'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/icon-theme "'candy-icons'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/cursor-theme "'volantes_cursors'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/cursor-size 24
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
    '')

    # budgie settings
    (writeShellScriptBin "apply-gtk-settings-budgie" ''
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/gtk-theme "'Qogir-Dark'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/icon-theme "'Qogir-Dark'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/cursor-theme "'Qogir'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/cursor-size 24
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/color-scheme/monospace-font-name "'D2CodingLigature Nerd Font Mono 11'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/background/picture-uri "'file://${pkgs.budgie-backgrounds}/share/backgrounds/budgie/singaporean-cityscape.jpg'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/screensaver/picture-uri "'file://${pkgs.budgie-backgrounds}/share/backgrounds/budgie/singaporean-cityscape.jpg'"
    '')

    #image viewer
    swayimg
  ];

  xdg.config.files."autostart/apply-gtk-settings-budgie.desktop".source = ./apply-gtk-settings-budgie.desktop;
}
