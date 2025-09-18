{ config, lib, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "D2CodingLigature Nerd Font Mono";
      size = 11;
    };
    themeFile = "Catppuccin-Mocha";
    enableGitIntegration = true;
  };
}
