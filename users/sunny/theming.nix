{pkgs, ...}: {
  packages = with pkgs; [
    adw-gtk3
    volantes-cursors
    adwaita-icon-theme
    (writeShellScriptBin "apply-gtk-settings" ''
      ${dconf}/bin/dconf write /org/gnome/desktop/interface/gtk-theme "'adw-gtk3'"
      ${dconf}/bin/dconf write /org/gnome/desktop/interface/icon-theme "'Adwaita'"
      ${dconf}/bin/dconf write /org/gnome/desktop/interface/cursor-theme "'volantes_cursors'"
      ${dconf}/bin/dconf write /org/gnome/desktop/interface/cursor-size 24
      ${dconf}/bin/dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
      ${dconf}/bin/dconf write /org/gnome/nautilus/icon-view/default-zoom-level "'small-plus'"
      ${dconf}/bin/dconf write /org/gnome/nautilus/preferences/default-folder-viewer "'icon-view'"
      ${dconf}/bin/dconf write /org/gnome/nautilus/preferences/migrated-gtk-settings true
      ${dconf}/bin/dconf write /org/gtk/gtk4/settings/file-chooser/show-hidden true
    '')
  ];

  files = {
    ".icons/default/index.theme".text = ''
      [Icon Theme]
      Name=Default
      Comment=Default Cursor Theme
      Inherits=volantes_cursors
    '';

    ".Xresources".text = ''
      Xcursor.theme:  volantes_cursors
      Xcursor.size:   24
    '';
  };
}
