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
    terminal = "${pkgs.foot}/bin/foot";
    extraConfig = {
      kb-primary-paste = "Control+V,Shift+Insert";
    };
  };
}
