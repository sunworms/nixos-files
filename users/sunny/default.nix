{ pkgs, ... }:

{
  imports = [
    ./packages
    ./wrappers.nix
  ];

  users.users.sunny.packages = with pkgs; [
    fishPlugins.tide
    fishPlugins.git-abbr
    xwayland-satellite
    swayimg
    gnome-themes-extra
    volantes-cursors
    candy-icons
    libnotify
    hyprpicker
    (writeShellScriptBin "reload-bar" ''
      if pgrep "waybar" > /dev/null
      then
          pkill "waybar"
      fi
      waybar
    '')
    (writeShellScriptBin "fuzzel-logout-menu" (builtins.readFile ./scripts/fuzzel-logout-menu.sh))
    (writeShellScriptBin "volume-notifs" (builtins.readFile ./scripts/volume-notifs.sh))
    (writeShellScriptBin "bright-notifs" (builtins.readFile ./scripts/bright-notifs.sh))
    (writeShellScriptBin "apply-gtk-settings" ''
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/gtk-theme "'Adwaita-dark'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/icon-theme "'candy-icons'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/cursor-theme "'volantes_cursors'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/cursor-size 24
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
    '')
    brightnessctl
    cliphist
    playerctl
    swayidle
    wlopm
    swww
  ];
}
