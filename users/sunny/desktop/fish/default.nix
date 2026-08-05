{pkgs, ...}: {
  xdg.config.files = {
    "fish/config.fish".source = ./config.fish;
    "fish/functions".source = ./functions;
    "starship.toml".source = (pkgs.formats.toml {}).generate "starship.toml" (import ./starship.nix);
  };

  packages = with pkgs; [
    starship
    fishPlugins.git-abbr
  ];
}
