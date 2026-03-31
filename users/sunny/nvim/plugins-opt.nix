{ pkgs }:

[
  {
    name = "blink.cmp";
    path = pkgs.vimPlugins.blink-cmp;
  }
  {
    name = "oil.nvim";
    path = pkgs.vimPlugins.oil-nvim;
  }
  {
    name = "nvim-autopairs";
    path = pkgs.vimPlugins.nvim-autopairs;
  }
  {
    name = "lualine-nvim";
    path = pkgs.vimPlugins.lualine-nvim;
  }
  {
    name = "nvim-lspconfig";
    path = pkgs.vimPlugins.nvim-lspconfig;
  }
  {
    name = "nvim-jdtls";
    path = pkgs.vimPlugins.nvim-jdtls;
  }
  {
    name = "conform.nvim";
    path = pkgs.vimPlugins.conform-nvim;
  }
  # needed for neogit
  {
    name = "telescope.nvim";
    path = pkgs.vimPlugins.telescope-nvim;
  }
  {
    name = "neogit";
    path = pkgs.vimPlugins.neogit;
  }
  {
    name = "nvim-treesitter";
    path = pkgs.vimPlugins.nvim-treesitter.withAllGrammars;
  }
  {
    name = "typst-preview.nvim";
    path = (
      pkgs.vimPlugins.typst-preview-nvim.overrideAttrs {
        postPatch = ''
          substituteInPlace lua/typst-preview/config.lua \
            --replace-fail "['tinymist'] = nil" "['tinymist'] = 'tinymist'" \
            --replace-fail "['websocat'] = nil" "['websocat'] = 'websocat'"
        '';
      }
    );
  }
]
