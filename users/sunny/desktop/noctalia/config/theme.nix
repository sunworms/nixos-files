{
  theme = {
    builtin = "Noctalia";
    source = "wallpaper";
    wallpaper_scheme = "faithful";
    community_palette = "Catppuccin Mocha Lavender";

    templates = {
      builtin_ids = ["foot" "gtk3" "gtk4" "kcolorscheme" "qt" "niri"];
      community_ids = ["yazi"];

      user = {
        variables = {
          input_path = "~/.config/noctalia/templates/variables.fish";
          output_path = "~/.config/foot/variables.fish";
          post_hook = "chmod +x ~/.config/foot/variables.fish && ~/.config/foot/reload.fish";
        };
        vim-colors = {
          input_path = "~/.config/noctalia/templates/vim-colors.vim";
          output_path = "~/.cache/noctalia/colors.vim";
          post_hook = "pkill -SIGUSR1 nvim; for s in $(vim --serverlist 2>/dev/null); do vim --servername \"$s\" --remote-send '<C-\\><C-N>:source ~/.cache/noctalia/colors.vim<CR>'; done";
        };
        zathura = {
          input_path = "~/.config/noctalia/templates/zathurarc";
          output_path = "~/.config/zathura/zathurarc";
          post_hook = ''
            #!/usr/bin/env bash
            set -euo pipefail

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
          '';
        };
      };
    };
  };

  wallpaper = {
    directory = "/home/sunny/Pictures/walls";
  };
}
