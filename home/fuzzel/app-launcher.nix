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
        terminal = "{pkgs.kitty}/bin/kitty";
        font = "D2CodingLigature Nerd Font:size=11";
        icon-theme = "Tela-circle-black-dark";
        anchor = "bottom-left";
        x-margin = 6;
        y-margin = 6;
      };
      colors = {
        background = "161616dd";
        text = "f2f4f8ff";
        # Using a soft blue for the prompt
        prompt = "78a9ffff";
        # Using a subtle light gray for placeholder text
        placeholder = "a2a9b4ff";
        input = "f2f4f8ff";
        # Match uses Accent Green
        match = "42be65ff";
        # Selection uses a subtle dark background color
        selection = "393939ff";
        selection-text = "f2f4f8ff";
        # Selection match uses Accent Green
        selection-match = "42be65ff";
        # Counter uses the same subtle light gray as the placeholder
        counter = "a2a9b4ff";
        # Accent color
        border = "f2f4f8ff";
      };
    };
  };
}
