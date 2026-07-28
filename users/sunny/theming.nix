{pkgs, ...}: let
  qtctFiles = builtins.listToAttrs (
    map
    (qt: {
      name = "${qt}ct/${qt}ct.conf";
      value.text = ''
        [Appearance]
        color_scheme_path=/home/sunny/.config/${qt}ct/colors/noctalia.conf
        custom_palette=true
        icon_theme=Adwaita
        standard_dialogs=default
        style=Fusion
      '';
    })
    [
      "qt5"
      "qt6"
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
    }
    // qtctFiles;

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
    libsForQt5.qt5ct
    qt6Packages.qt6ct
    xsettingsd
    xrdb
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
