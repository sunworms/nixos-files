{
  theme = {
    builtin = "Noctalia";
    source = "wallpaper";
    wallpaper_scheme = "faithful";
    community_palette = "Catppuccin Lavender";

    templates = {
      builtin_ids = ["foot" "gtk3" "gtk4" "kcolorscheme" "qt" "umbriel"];
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
          post_hook = "pkill -USR1 vim";
        };
        zathura = {
          input_path = "~/.config/noctalia/templates/zathurarc";
          output_path = "~/.config/zathura/zathurarc";
        };
      };
    };
  };

  wallpaper = {
    directory = "/home/sunny/Pictures/walls";
  };
}
