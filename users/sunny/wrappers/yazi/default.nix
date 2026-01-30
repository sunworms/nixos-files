{ pkgs, inputs }:

let
  pluginDir = pkgs.linkFarm "yazi-plugins" [
    {
      name = "git.yazi";
      path = pkgs.yaziPlugins.git;
    }
    {
      name = "chmod.yazi";
      path = pkgs.yaziPlugins.chmod;
    }
    {
      name = "full-border.yazi";
      path = pkgs.yaziPlugins.full-border;
    }
    {
      name = "sudo.yazi";
      path = pkgs.yaziPlugins.sudo;
    }
    {
      name = "gvfs.yazi";
      path = inputs.yazi-gvfs;
    }
  ];
in
pkgs.symlinkJoin {
  name = "yazi-wrapped";
  buildInputs = [ pkgs.makeWrapper ];
  paths = [ pkgs.yazi ];
  postBuild = ''
    mkdir -p $out/yazi/plugins
    ln -s ${pluginDir}/* $out/yazi/plugins/
    ln -s ${./init.lua} $out/yazi/init.lua
    ln -s ${./keymap.toml} $out/yazi/keymap.toml
    ln -s ${./yazi.toml} $out/yazi/yazi.toml

    wrapProgram $out/bin/yazi \
      --set YAZI_CONFIG_HOME $out/yazi
  '';
  meta.mainProgram = "yazi";
}
