{
  pkgs,
  inputs,
  ...
}:
let
  inherit (inputs.niri-nix.lib) validatedConfigFor;
  inherit (inputs.niri-nix.packages.${pkgs.stdenv.hostPlatform.system}) niri-unstable;
in
{
  imports = [
    ./dms
    ./nvim
    ./matugen
    ./yazi
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
    "fish/config.fish".source = ./config.fish;
    "foot/foot.ini".source = ./foot.ini;
    "git/config".source = ./gitconfig;
    "hyfetch.json".source = ./hyfetch.json;
    "spicetify/config-xpui.ini".source = ./spicetify-config-xpui.ini;
    "niri/config.kdl".text = validatedConfigFor niri-unstable (builtins.readFile ./niri.kdl);

    "mimeapps.list".source = ./mimeapps.list;
    "net.imput.helium/WidevineCdm/latest-component-updated-widevine-cdm".text = ''
      {"Path":"${pkgs.widevine-cdm}/share/google/chrome/WidevineCdm"}
    '';
  };

  packages = with pkgs; [
    foot
    hyfetch
    git
    xwayland-satellite-unstable
  ];
}
