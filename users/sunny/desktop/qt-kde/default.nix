{ ... }:

{
  xdg.config.files = {
    "kdeglobals".text = ''
      [UiSettings]
      ColorScheme=DankMatugen
    '';
    "okular.kmessagebox".text = ''
      [General]
      presentationInfo=4
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
  };
}
