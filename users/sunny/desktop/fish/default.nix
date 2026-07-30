{pkgs, ...}: {
  xdg.config.files = {
    "fish/config.fish".source = ./config.fish;
  };

  packages = with pkgs.fishPlugins; [
    tide
    git-abbr
  ];
}
