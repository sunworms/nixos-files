{ pkgs, ... }:
let
  plugin-list = import ./plugins.nix { inherit pkgs; };
  yazi-plugins = pkgs.linkFarm "yazi-plugins" plugin-list;
in
{
  xdg.config.files = {
    "yazi/plugins".source = yazi-plugins;
    "yazi/init.lua".source = ./init.lua;
    "yazi/yazi.toml".source = ./yazi.toml;
    "yazi/keymap.toml".source = ./keymap.toml;
  };

  packages = with pkgs; [
    (yazi.override {
      _7zz = pkgs._7zz-rar;
    })
  ];
}
