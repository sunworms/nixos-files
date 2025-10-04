{ config, lib, pkgs, ... }:
{
  imports = [
    ./scripts.nix
  ];

  programs.rofi = {
    enable = true;
    cycle = true;
    modes = [
      "drun"
      "window"
      "run"
      "filebrowser"
    ];
    terminal = "${pkgs.kitty}/bin/kitty";
    extraConfig = {
      kb-primary-paste = "Control+V,Shift+Insert";
    };
  };
}
