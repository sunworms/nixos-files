{ config, lib, pkgs, ... }:

{
  imports = [
    ./terminal-material-dark.nix
  ];
  programs.kitty = {
    enable = true;
    font = {
      name = "D2CodingLigature Nerd Font Mono";
      size = 11;
    };
    extraConfig = ''
    include material-dark.conf
    '';
    enableGitIntegration = true;
  };
}
