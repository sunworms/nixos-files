{ config, lib, pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";
      font-family = "D2CodingLigature Nerd Font Mono";
      font-size = 11;
    };
  };
}
