{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerd-fonts.d2coding
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];
}
