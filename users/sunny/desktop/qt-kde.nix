{ ... }:

let
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
in
{
  xdg.config.files = {
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
}
