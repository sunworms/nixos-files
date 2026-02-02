{ pkgs, ... }:

{
  imports = [
    ./packages
    ./desktop
    ./browser.nix
  ];

  directory = "/home/sunny";

  environment.sessionVariables = {
    CLUTTER_BACKEND = "wayland,x11,*";
    GDK_BACKEND = "wayland,x11,*";
    NIXOS_OZONE_WL = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    SDL_VIDEODRIVER = "wayland,x11,*";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    EDITOR = "emacsclient";
    SUDO_EDITOR = "emacsclient";
    VISUAL = "emacsclient";
    GTK_THEME = "adw-gtk3";
    QT_QPA_PLATFORMTHEME = "gtk3";
  };

  packages = with pkgs; [
    fishPlugins.tide
    fishPlugins.git-abbr
    adw-gtk3
    volantes-cursors
    candy-icons
    swayimg
    (writeShellScriptBin "apply-gtk-settings" ''
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/gtk-theme "'adw-gtk3'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/icon-theme "'candy-icons'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/cursor-theme "'volantes_cursors'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/cursor-size 24
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
    '')
  ];
}
