{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./matugen
    ./scripts
    ./helix
    ./services.nix
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
    "waybar/config.jsonc".source = ./waybar-config;
    "waybar/style.css".source = ./waybar-style.css;
    "foot/foot.ini".source = ./foot.ini;
    "fuzzel/fuzzel.ini".source = ./fuzzel.ini;
    "mako/config".source = ./mako;
    "git/config".source = ./gitconfig;
    "glide/glide.ts".source = ./glide.ts;
    "hyfetch.json".source = ./hyfetch.json;
    "niri/config.kdl".source = ./niri.kdl;

    "mimeapps.list".source = ./mimeapps.list;
    "net.imput.helium/WidevineCdm/latest-component-updated-widevine-cdm".text = ''
      {"Path":"${pkgs.widevine-cdm}/share/google/chrome/WidevineCdm"}
    '';
  };

  xdg.data.files = {
    "applications/Helix.desktop".source = ./Helix.desktop;
  };

  packages = with pkgs; [
    inputs.helix.packages.${pkgs.stdenv.hostPlatform.system}.default
    lazygit
    waybar
    matugen
    swww
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
  ];
}
