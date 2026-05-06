{ pkgs, ... }:

{
  packages = with pkgs; [ matugen ];

  xdg.config.files."matugen".source = ./config;
}
