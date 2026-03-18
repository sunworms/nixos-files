{ pkgs, ... }:

{
  imports = [
    ./packages
    ./desktop
    ./nvim
    ./browser.nix
  ];

  directory = "/home/sunny";

  packages = with pkgs; [
    # fish plugins
    fishPlugins.tide
    fishPlugins.git-abbr

    # theming
    adw-gtk3
    volantes-cursors
    candy-icons
    (writeShellScriptBin "apply-gtk-settings" ''
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/gtk-theme "'adw-gtk3'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/icon-theme "'candy-icons'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/cursor-theme "'volantes_cursors'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/cursor-size 24
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
      ${pkgs.dconf}/bin/dconf write /org/cinnamon/desktop/applications/terminal/exec "'alacritty'"
      ${pkgs.dconf}/bin/dconf write /org/cinnamon/desktop/applications/terminal/exec-arg "'-e'"
      ${pkgs.dconf}/bin/dconf write /org/nemo/preferences/thumbnail-limit "uint64 68719476736"
      ${pkgs.dconf}/bin/dconf write /org/nemo/preferences/show-hidden-files true
    '')

    #image viewer
    swayimg
  ];
}
