{ pkgs, lib, ... }:
let
  opt-plugin-list = import ./plugins-opt.nix { inherit pkgs; };
  start-plugin-list = import ./plugins-start.nix { inherit pkgs; };
  nvim-opt-plugins = pkgs.linkFarm "nvim-opt-plugins" opt-plugin-list;
  nvim-start-plugins = pkgs.linkFarm "nvim-start-plugins" start-plugin-list;
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
    "nvim/site/pack/plugins/start".source = nvim-start-plugins;
    "nvim/site/pack/plugins/opt".source = nvim-opt-plugins;
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
