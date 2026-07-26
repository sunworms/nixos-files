{
  pkgs,
  lib,
  ...
}: {
  xdg.config.files = {
    "fish/config.fish".source = import ./config.nix {inherit pkgs lib;};
  };

  packages = with pkgs.fishPlugins; [
    tide
    git-abbr
  ];
}
