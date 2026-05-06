{ pkgs, ... }:

{
  packages = with pkgs; [
    brightnessctl
    soteria
    awww
    swayidle
    gtklock
    cliphist
    rofimoji
    pwvucontrol
  ];

  xdg.config.files = {
    "niri/config.kdl".source = ./config.kdl;
  };
}
