{ pkgs, ... }:

{
  xdg.config.files."hellwal/templates".source = ./templates;

  packages = [
    (pkgs.writeShellScriptBin "hellwal-sh" ''
      cp ~/.cache/hellwal/btop.theme ~/.config/btop/themes/hellwal
      cp ~/.cache/hellwal/discord.css ~/.config/vesktop/themes/midnight-discord.css
      cp ~/.cache/hellwal/emacs.el ~/.emacs.d/themes/hellwal-theme.el
      cp ~/.cache/hellwal/foot.ini ~/.config/foot/colors.ini
      cp ~/.cache/hellwal/fuzzel.ini ~/.config/fuzzel/colors.ini
      cp ~/.cache/hellwal/gtk.css ~/.config/gtk-3.0/gtk.css
      cp ~/.cache/hellwal/gtk.css ~/.config/gtk-4.0/gtk.css
      cp ~/.cache/hellwal/mako-colors ~/.config/mako/colors
      cp ~/.cache/hellwal/niri.kdl ~/.config/niri/colors.kdl
      cp ~/.cache/hellwal/waybar.css ~/.config/waybar/colors.css
      cp ~/.cache/hellwal/zathura-colors ~/.config/zathura/zathurarc

      pkill -USR2 btop || true
      pkill -SIGUSR2 waybar
      makoctl reload
      emacsclient -e '(load "~/.emacs.d/init.el")'
    '')
  ];
}
