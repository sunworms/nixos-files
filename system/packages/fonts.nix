{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    maple-mono.NF
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
      serif = [ "Maple Mono NF" ];
      sansSerif = [ "Maple Mono NF" ];
      monospace = [ "Maple Mono NF" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
