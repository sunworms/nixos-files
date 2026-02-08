{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
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
      serif = [ "Iosevka Nerd Font Propo" ];
      sansSerif = [ "Iosevka Nerd Font Propo" ];
      monospace = [ "Iosevka Nerd Font Mono" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
