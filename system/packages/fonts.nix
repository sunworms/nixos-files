{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    aporetic
    nerd-fonts.symbols-only
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  fonts.fontconfig = {
    enable = true;
    hinting.enable = true;
    antialias = true;
    subpixel.rgba = "rgb";
    cache32Bit = true;
    defaultFonts = {
      serif = [ "Aporetic Serif" ];
      sansSerif = [ "Aporetic Sans" ];
      monospace = [ "Aporetic Sans Mono" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
