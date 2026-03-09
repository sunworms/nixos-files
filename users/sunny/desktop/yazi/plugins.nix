{ pkgs }:

[
  {
    name = "wl-clipboard.yazi";
    path = pkgs.yaziPlugins.wl-clipboard;
  }
  {
    name = "vcs-files.yazi";
    path = pkgs.yaziPlugins.vcs-files;
  }
  {
    name = "sudo.yazi";
    path = pkgs.yaziPlugins.sudo;
  }
  {
    name = "gvfs.yazi";
    path = pkgs.yaziPlugins.gvfs;
  }
  {
    name = "git.yazi";
    path = pkgs.yaziPlugins.git;
  }
  {
    name = "full-border.yazi";
    path = pkgs.yaziPlugins.full-border;
  }
  {
    name = "chmod.yazi";
    path = pkgs.yaziPlugins.chmod;
  }
]
