{
  pkgs,
  sources,
  ...
}:

{
  imports = [
    ./matugen
    ./scripts
    ./helix
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
    "btop/btop.conf".source = ./btop.conf;

    "mimeapps.list".source = ./mimeapps.list;
    "net.imput.helium/WidevineCdm/latest-component-updated-widevine-cdm".text = ''
      {"Path":"${pkgs.widevine-cdm}/share/google/chrome/WidevineCdm"}
    '';
  };

  xdg.data.files = {
    "applications/Helix.desktop".source = ./Helix.desktop;
  };

  packages = with pkgs; [
    helix
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
    soteria
    (writeShellScriptBin "niri-bar-toggle" ''
      trap "" SIGUSR1

      sleep 0.1

      ${pkgs.waybar}/bin/waybar &

      ${(pkgs.callPackage ../../../niri.nix { inherit sources; })}/bin/niri msg --json event-stream | while read -r event; do
      if echo "$event" | ${pkgs.jq}/bin/jq -e '.OverviewOpenedOrClosed' > /dev/null 2>&1; then
        ${pkgs.procps}/bin/pkill -SIGUSR1 waybar
      fi
      
      done
    '')
  ];
}
