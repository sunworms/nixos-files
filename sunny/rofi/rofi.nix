{ config, lib, pkgs, ... }:
{
  imports = [
    ./scripts.nix
  ];

  programs.rofi = {
    enable = true;
    cycle = true;
    font = "D2CodingLigature Nerd Font Propo 12";
    modes = [
      "drun"
      "window"
      "run"
      "filebrowser"
    ];
    terminal = "${pkgs.kitty}/bin/kitty";
    theme = "gruvbox-dark-hard";
    extraConfig = {
      kb-primary-paste = "Control+V,Shift+Insert";
    };
  };
}
