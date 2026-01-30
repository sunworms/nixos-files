{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerd-fonts.d2coding
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    dejavu_fonts
  ];

  fonts.fontconfig = {
    enable = true;
    cache32Bit = true;
    defaultFonts = {
      serif = [ "Dejavu Serif" ];
      sansSerif = [ "Dejavu Sans" ];
      monospace = [ "D2CodingLigature Nerd Font Mono" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
