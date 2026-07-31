{
  theme = {
    builtin = "Noctalia";
    source = "wallpaper";
    wallpaper_scheme = "faithful";
    community_palette = "Catppuccin Lavender";

    templates = {
      builtin_ids = ["foot" "gtk3" "gtk4" "kcolorscheme" "qt" "niri"];
      community_ids = ["yazi"];

      user = {
        nvim-base16 = {
          input_path = "~/.config/noctalia/templates/matugen.lua";
          output_path = "~/.config/nvim/lua/matugen.lua";
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
