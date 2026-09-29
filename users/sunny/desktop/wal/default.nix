{pkgs, ...}: {
  packages = with pkgs; [
    pywal16
    (writeShellScriptBin "apply-gtk4-theme" ''
      current=$(dconf read /org/gnome/desktop/interface/color-scheme)

      if [[ "$current" == "'prefer-dark'" ]]; then
          dconf write /org/gnome/desktop/interface/color-scheme "'prefer-light'"
          dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
      else
          dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
          dconf write /org/gnome/desktop/interface/color-scheme "'prefer-light'"
      fi
    '')
    (writeShellScriptBin "wal-post-hook" ''
      set -euo pipefail

      pkill -SIGUSR2 waybar || true
      pkill -USR2 btop || true
      dconf write /org/gnome/desktop/interface/gtk-theme "\'\'"
      dconf write /org/gnome/desktop/interface/gtk-theme "'adw-gtk3'"
      apply-gtk4-theme
      swaync-client --reload-config && swaync-client --reload-css
      niri msg action load-config-file
      pkill -SIGUSR1 nvim
      chmod +x ~/.config/foot/variables.fish && ~/.config/foot/reload.fish

      zathura_instances=$(dbus-send --session \
          --dest=org.freedesktop.DBus \
          --type=method_call \
          --print-reply \
          /org/freedesktop/DBus \
          org.freedesktop.DBus.ListNames |
          grep -o 'org.pwmt.zathura.PID-[0-9]*' || true)

      for id in $zathura_instances; do
          dbus-send --session \
              --dest="$id" \
              --type=method_call \
              /org/pwmt/zathura \
              org.pwmt.zathura.ExecuteCommand \
              string:"source"
      done
    '')
  ];

  xdg.config.files = {
    "wal/templates".source = ./templates;
    "foot/reload.fish" = {
      executable = true;
      text =
        #fish
        ''
          #!${pkgs.fish}/bin/fish

          set -l theme_script "$HOME/.cache/wal/variables.fish"

          if test -f $theme_script
            for tty in /dev/pts/*
              if test -w $tty
                $theme_script > $tty 2>/dev/null
              end
            end
          end
        '';
    };
  };
}
