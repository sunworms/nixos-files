{ pkgs }:

[
  {
    name = "nvim-tree";
    path = pkgs.vimPlugins.nvim-tree-lua;
  }
  # needed for nvim tree
  {
    name = "nvim-web-devicons";
    path = pkgs.vimPlugins.nvim-web-devicons;
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
    name = "base16-nvim";
    path = pkgs.vimPlugins.base16-nvim;
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
  {
    name = "blink.cmp";
    path = pkgs.vimPlugins.blink-cmp;
  }
  # needed for blink.cmp
  {
    name = "friendly-snippets";
    path = pkgs.vimPlugins.friendly-snippets;
  }
  # needed for neogit
  {
    name = "telescope.nvim";
    path = pkgs.vimPlugins.telescope-nvim;
  }
  # needed for telescope and neogit
  {
    name = "plenary.nvim";
    path = pkgs.vimPlugins.plenary-nvim;
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
            --replace "['tinymist'] = nil" "['tinymist'] = 'tinymist'" \
            --replace "['websocat'] = nil" "['websocat'] = 'websocat'"
        '';
      }
    );
  }
]
