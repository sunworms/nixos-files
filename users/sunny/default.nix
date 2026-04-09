{ pkgs, ... }:

{
  imports = [
    ./packages
    ./desktop
    ./nvim.nix
    ./browser.nix
  ];

  directory = "/home/sunny";

  packages = with pkgs; [
    # fish plugins
    fishPlugins.pure
    fishPlugins.git-abbr

    # theming
    adw-gtk3
    volantes-cursors
    candy-icons
    (writeShellScriptBin "apply-gtk-settings" ''
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/gtk-theme "'adw-gtk3'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/icon-theme "'candy-icons'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/cursor-theme "'volantes_cursors'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/cursor-size 24
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/nautilus/icon-view/default-zoom-level "'small-plus'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/nautilus/preferences/default-folder-viewer "'icon-view'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/nautilus/preferences/migrated-gtk-settings true
      ${pkgs.dconf}/bin/dconf write /org/gtk/gtk4/settings/file-chooser/show-hidden true
    '')
    libsForQt5.qt5ct
    qt6Packages.qt6ct

    # image viewer
    swayimg

    # other
    ripgrep
  ];
}
