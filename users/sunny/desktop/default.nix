{ pkgs, ... }:
{
  imports = [
    ./dms
    ./matugen
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
    "alacritty/alacritty.toml".source = ./alacritty.toml;
    "git/config".source = ./gitconfig;
    "hyfetch.json".source = ./hyfetch.json;
    "niri/config.kdl".source = ./niri.kdl;

    "mimeapps.list".source = ./mimeapps.list;
    "net.imput.helium/WidevineCdm/latest-component-updated-widevine-cdm".text = ''
      {"Path":"${pkgs.widevine-cdm}/share/google/chrome/WidevineCdm"}
    '';
  };

  xdg.data.files."applications/nvim-alacritty.desktop".source = ./nvim-alacritty.desktop;

  packages = with pkgs; [
    alacritty
    hyfetch
    git
    xwayland-satellite
    nautilus
  ];
}
