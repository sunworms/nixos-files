{ pkgs, ... }:
{
  imports = [
    ./dms
  ];

  files = {
    ".gtkrc-2.0".text = ''
      gtk-theme-name="adw-gtk3"
      gtk-icon-theme-name="candy-icons"
      gtk-cursor-theme-name="volantes_cursors"
      gtk-cursor-theme-size=24
    '';

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

    ".face".source = ../../../assets/icons/haruta.jpg;
  };

  xdg.config.files = {
    "rclone/rclone.conf".source = ./rclone.conf;
    "fish/config.fish".source = ./config.fish;
    "alacritty/alacritty.toml".source = ./alacritty.toml;
    "git/config".source = ./gitconfig;
    "hyfetch.json".source = ./hyfetch.json;
    "niri/config.kdl".source = ./niri.kdl;

    "kdeglobals".text = ''
      [UiSettings]
      ColorScheme=DankMatugen
    '';
    "qt6ct/qt6ct.conf".text = ''
      [Appearance]
      color_scheme_path=/home/sunny/.config/qt6ct/colors/matugen.conf
      custom_palette=true
      icon_theme=candy-icons
      standard_dialogs=default
      style=Fusion
    '';
    "qt5ct/qt5ct.conf".text = ''
      [Appearance]
      color_scheme_path=/home/sunny/.config/qt5ct/colors/matugen.conf
      custom_palette=true
      icon_theme=candy-icons
      standard_dialogs=default
      style=Fusion
    '';
    "okular.kmessagebox".text = ''
      [General]
      presentationInfo=4
    '';

    "mimeapps.list".source = ./mimeapps.list;
    "net.imput.helium/WidevineCdm/latest-component-updated-widevine-cdm".text = ''
      {"Path":"${pkgs.widevine-cdm}/share/google/chrome/WidevineCdm"}
    '';
  };

  xdg.data.files = {
    "applications/nvim-alacritty.desktop".text = ''
      [Desktop Entry]
      Encoding=UTF-8
      Version=1.0
      Type=Application
      NoDisplay=true
      Exec=alacritty -e nvim %f
      Name=Neovim
      Comment=Custom definition for alacritty
    '';
    "nautilus/scripts/Open with Custom Command" = {
      text = ''
        #!/usr/bin/env bash
        var=$(${pkgs.zenity}/bin/zenity --entry \
        --title="Add Application" \
        --text="Use a custom command" \
        --width="320")
        if [ $? -eq 0 ] && [ "$var" ]; then
          $var "$1"
        else
          exit 0
        fi
      '';
      executable = true;
    };
  };

  packages = with pkgs; [
    alacritty
    hyfetch
    git
    xwayland-satellite
    nautilus
  ];
}
