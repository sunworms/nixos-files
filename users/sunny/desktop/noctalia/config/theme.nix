{
  theme = {
    builtin = "Noctalia";
    source = "wallpaper";
    wallpaper_scheme = "faithful";
    community_palette = "Catppuccin Lavender";

    templates = {
      community_ids = [];

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
      };
    };
  };

  wallpaper = {
    directory = "/home/sunny/Pictures/walls";
  };
}
