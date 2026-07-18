{ pkgs, ... }:

{
  xdg.config.files = {
    "fish/config.fish".source = ./config.fish;
    # "fish/functions".source = ./functions;
  };

  packages = with pkgs.fishPlugins; [
    tide
    git-abbr
  ];
}
