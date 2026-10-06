{
  pkgs,
  inputs,
}: let
  neovim = (import inputs.mnw.src).lib.wrap pkgs {
    neovim = pkgs.neovim-unwrapped;
    luaFiles = [
      "${./config/init.lua}"
    ];
    plugins = {
      start = with pkgs.vimPlugins; [
        lz-n
        friendly-snippets
        nvim-web-devicons
        catppuccin-nvim
      ];
      opt = with pkgs.vimPlugins; [
        nvim-treesitter.withAllGrammars
        gitsigns-nvim
        yazi-nvim
        fzf-lua
        blink-cmp
        nvim-autopairs
        nvim-lspconfig
        conform-nvim
        mini-statusline
        vimtex
        (typst-preview-nvim.overrideAttrs {
          postPatch = ''
            substituteInPlace lua/typst-preview/config.lua \
            	--replace-fail "['tinymist'] = nil" "['tinymist'] = 'tinymist'" \
            	--replace-fail "['websocat'] = nil" "['websocat'] = 'websocat'"
          '';
        })
      ];

      dev.default = {
        pure = "${./config}";
        impure = "/home/sunny/nixos-files/users/sunny/nvim/config";
      };
    };

    extraBinPath = with pkgs; [
      lua-language-server
      stylua
    ];
  };
in
  neovim.overrideAttrs (old: {
    meta = (old.meta or {}) // {mainProgram = "nvim";};
  })
