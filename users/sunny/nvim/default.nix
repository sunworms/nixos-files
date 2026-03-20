{ pkgs, inputs, ... }:
let
  plugin-list = import ./plugins.nix { inherit pkgs inputs; };
  nvim-plugins = pkgs.linkFarm "nvim-plugins" plugin-list;
  parsers = pkgs.symlinkJoin {
    name = "treesitter-parsers";
    paths = pkgs.vimPlugins.nvim-treesitter.withAllGrammars.dependencies;
  };
in
{
  xdg.data.files = {
    "nvim/site/pack/plugins/start".source = nvim-plugins;
    "nvim/site/parser".source = "${parsers}/parser";
  };

  xdg.config.files = {
    "nvim/init.lua".source = ./init.lua;
    "nvim/lua/plugins".source = ./plugins;
  };

  packages = with pkgs; [
    neovim
    lua-language-server
    ripgrep
    fd
  ];
}
