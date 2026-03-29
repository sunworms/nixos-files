{ pkgs, ... }:

{
  xdg.config.files = {
    "alacritty/alacritty.toml".source = ./alacritty.toml;
  };

  packages = with pkgs; [
    alacritty
  ];
}
