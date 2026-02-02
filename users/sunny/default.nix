{ pkgs, ... }:

{
  imports = [
    ./packages
    ./desktop
    ./browser.nix
  ];

  directory = "/home/sunny";

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
