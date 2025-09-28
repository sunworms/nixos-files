{ config, lib, pkgs, ... }:

{
  imports = [
    ./scripts.nix
  ];

  files.".config/fuzzel/fuzzel.ini".text = ''
  [colors]
  background=161616dd
  border=f2f4f8ff
  counter=a2a9b4ff
  input=f2f4f8ff
  match=42be65ff
  placeholder=a2a9b4ff
  prompt=78a9ffff
  selection=393939ff
  selection-match=42be65ff
  selection-text=f2f4f8ff
  text=f2f4f8ff

  [main]
  anchor=bottom-left
  font=D2CodingLigature Nerd Font:size=11
  icon-theme=Tela-circle-black-dark
  terminal=${pkgs.kitty}/bin/kitty
  x-margin=6
  y-margin=6
  '';
}
