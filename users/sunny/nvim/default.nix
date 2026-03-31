{ pkgs, lib, ... }:
let
  plugin-list = import ./plugins.nix { inherit pkgs; };
  nvim-plugins = pkgs.linkFarm "nvim-plugins" plugin-list;
  parsers = pkgs.symlinkJoin {
    name = "treesitter-parsers";
    paths = pkgs.vimPlugins.nvim-treesitter.withAllGrammars.dependencies;
  };
  pluginConfigs = builtins.readDir ./plugins;
  pluginFiles = lib.mapAttrs' (name: type: {
    name = "nvim/lua/plugins/${name}";
    value = {
      source = ./plugins/${name};
    };
  }) pluginConfigs;
in
{
  xdg.data.files = {
    "nvim/site/pack/plugins/start".source = nvim-plugins;
    "nvim/site/parser".source = "${parsers}/parser";
  };

  xdg.config.files = {
    "nvim/init.lua".source = ./init.lua;
    "nvim/lua/matugen-template.lua".source = ./matugen-template.lua;
  }
  // pluginFiles;

  packages = with pkgs; [
    neovim
    lua-language-server
    ripgrep
    fd
  ];
}
