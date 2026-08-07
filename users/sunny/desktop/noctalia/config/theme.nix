{
  theme = {
    builtin = "Noctalia";
    source = "wallpaper";
    wallpaper_scheme = "vibrant";
    community_palette = "Catppuccin Lavender";

    templates = {
      builtin_ids = ["foot" "gtk3" "gtk4" "kcolorscheme" "qt" "niri"];
      community_ids = ["yazi"];

      user = {
        variables = {
          input_path = "~/.config/noctalia/templates/variables.fish";
          output_path = "~/.config/foot/variables.fish";
          post_hook = "chmod +x ~/.config/foot/variables.fish && ~/.config/foot/reload.fish";
        };
        nvim-base16 = {
          input_path = "~/.config/noctalia/templates/matugen.lua";
          output_path = "~/.config/nvim/lua/matugen.lua";
          post_hook = "pkill -SIGUSR1 nvim";
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
