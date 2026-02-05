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
    
    #image viewer
    swayimg
  ];
}
