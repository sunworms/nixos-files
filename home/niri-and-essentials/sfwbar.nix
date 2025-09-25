{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    sfwbar
  ];

  xdg.configFile.".config/sfwbar/sfwbar.config".source = ./sfwbar.config;
}
