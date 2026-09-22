{pkgs}: let
  lib = pkgs.lib;
  plugins = with pkgs.yaziPlugins; {
    inherit git gvfs yafg chmod mount full-border drag;
  };
in
  pkgs.linkFarm "yazi-plugins" (
    lib.mapAttrsToList (name: pkg: {
      name = "${name}.yazi";
      path = pkg;
    })
    plugins
  )
