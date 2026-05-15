{ pkgs, ... }:

{
  packages = with pkgs; [
    foot
  ];

  xdg.config.files."foot/foot.ini".source = ./foot.ini;
}
