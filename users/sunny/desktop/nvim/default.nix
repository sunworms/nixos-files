{ pkgs, ... }:
let
  plugin-list = import ./plugins.nix { inherit pkgs; };
  
  nvim-plugins = pkgs.linkFarm "nvim-plugins" plugin-list;
in
{
  xdg.data.files."nvim/site/pack/plugins/start".source = nvim-plugins;

  xdg.config.files = {
    "nvim/init.lua".source = ./init.lua;
    "nvim/lua/plugins".source = ./plugins;
  };

  packages = with pkgs; [
    neovim
    lua-language-server
    ripgrep
  ];
}
