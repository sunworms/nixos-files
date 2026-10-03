{pkgs, ...}: {
  programs.helix = {
    enable = true;
    plugins = with pkgs.helixPlugins; [
      smooth-scroll
      helix-file-watcher
      steel-pty
      moka
      glyph
    ];
  };

  xdg.config.files = {
    "helix/config.toml".source = ./config.toml;
    "helix/languages.toml".source = ./languages.toml;
    "helix/init.scm".source = ./init.scm;
  };
}
