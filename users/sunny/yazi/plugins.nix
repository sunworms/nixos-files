{pkgs}: let
  lib = pkgs.lib;
  plugins = with pkgs.yaziPlugins; {
    inherit git sudo gvfs yafg chmod mount clipboard full-border drag;
  };
in
  pkgs.linkFarm "yazi-plugins" (
    lib.mapAttrsToList (name: pkg: {
      name = "${name}.yazi";
      path = pkg;
    })
    plugins
  )
