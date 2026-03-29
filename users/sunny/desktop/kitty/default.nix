{ pkgs, ... }:

{
  xdg.config.files = {
    "kitty/kitty.conf".source = ./kitty.conf;
  };

  packages = with pkgs; [
    kitty
  ];
}
