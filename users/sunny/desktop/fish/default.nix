{pkgs, ...}: {
  xdg.config.files = {
    "fish/config.fish".source = ./config.fish;
    "fish/functions".source = ./functions;
  };

  packages = with pkgs; [
    fish
    fishPlugins.tide
    fishPlugins.git-abbr
  ];
}
