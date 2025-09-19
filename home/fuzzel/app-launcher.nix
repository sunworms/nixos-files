{ config, lib, pkgs, ... }:

{
  imports = [
    ./cliphist.nix
    ./logout-menu.nix
  ];

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "{pkgs.ghostty}/bin/ghostty";
        font = "D2CodingLigature Nerd Font:size=13";
        icon-theme = "Tela-circle-dracula-dark";
        anchor = "bottom-left";
      };
      colors = {
        background = "1e1e2edd";
        text = "cdd6f4ff";
        prompt = "bac2deff";
        placeholder = "7f849cff";
        input = "cdd6f4ff";
        match = "89dcebff";
        selection = "585b70ff";
        selection-text = "cdd6f4ff";
        selection-match = "89dcebff";
        counter = "7f849cff";
        border = "b4befeff";
      };
    };
  };
}
