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
      serif = [ "Maple Mono NF Light" ];
      sansSerif = [ "Maple Mono NF Light" ];
      monospace = [ "Maple Mono NF Light" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
