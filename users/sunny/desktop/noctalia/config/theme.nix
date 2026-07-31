{
  theme = {
    builtin = "Noctalia";
    source = "community";
    wallpaper_scheme = "faithful";
    community_palette = "Catppuccin Lavender";

    templates = {
      builtin_ids = ["foot" "gtk3" "gtk4" "kcolorscheme" "qt" "niri"];
      community_ids = ["discord" "zen-browser"];

      user = {
        /*
          neovim-colors = {
          input_path = "~/.config/noctalia/templates/neovim-colors.lua";
          output_path = "~/.config/nvim/colors/base46-matugen.lua";
        };

        neovim-lualine = {
          input_path = "~/.config/noctalia/templates/neovim-lualine.lua";
          output_path = "~/.config/nvim/lua/lualine/themes/base46-matugen.lua";
        };
        */

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
