{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerd-fonts.d2coding
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    newcomputermodern
  ];

  fonts.fontconfig = {
    enable = true;
    hinting.enable = true;
    antialias = true;
    subpixel.rgba = "rgb";
    cache32Bit = true;
    defaultFonts = {
      serif = [ "Noto Serif" ];
      sansSerif = [ "Noto Sans" ];
      monospace = [ "D2CodingLigature Nerd Font Mono" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
