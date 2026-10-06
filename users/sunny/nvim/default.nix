{
  lib,
  pkgs,
  ...
}: let
  plugins = {
    start = with pkgs.vimPlugins; [
      lz-n
      friendly-snippets
      nvim-web-devicons
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
  };

  packDir = pkgs.vimUtils.packDir {hjem = plugins;};
in {
  packages = with pkgs; [
    neovim
    (writeShellScriptBin "vi" ''
      exec ${lib.getExe pkgs.neovim} "$@"
    '')
    (writeShellScriptBin "vim" ''
      exec ${lib.getExe pkgs.neovim} "$@"
    '')
    lua-language-server
    stylua
  ];

  xdg.config.files."nvim".source = ./config;

  xdg.data.files."nvim/site/pack".source = "${packDir}/pack";
}
