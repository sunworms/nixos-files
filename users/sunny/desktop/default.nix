{
  pkgs,
  sources,
  ...
}:

let
  niri-with-wall = pkgs.replaceVars ./niri.kdl {
    WALLPAPER = "${sources.walls.src}/hunline/tsukumo-1.png";
    DEFAULT_AUDIO_SINK = null;
    DEFAULT_AUDIO_SOURCE = null;
  };
in
{
  imports = [
    ./scripts
    ./nvim
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
    "foot/foot.ini".source = ./foot.ini;
    "fuzzel/fuzzel.ini".source = ./fuzzel.ini;
    "mako/config".source = ./mako;
    "git/config".source = ./gitconfig;
    "hyfetch.json".source = ./hyfetch.json;
    "niri/config.kdl".source = niri-with-wall;
    "btop/btop.conf".source = ./btop.conf;

    "mimeapps.list".source = ./mimeapps.list;
    "net.imput.helium/WidevineCdm/latest-component-updated-widevine-cdm".text = ''
      {"Path":"${pkgs.widevine-cdm}/share/google/chrome/WidevineCdm"}
    '';
  };

  packages = with pkgs; [
    foot
    mako
    fuzzel
    cliphist
    rofimoji
    brightnessctl
    gtklock
    swayidle
    libnotify
    btop
    playerctl
    hyfetch
    git
    nautilus
    xwayland-satellite
    soteria
    (callPackage ./system-menu.nix {})
  ];
}
