{ pkgs, ... }:

{
  packages = with pkgs; [ btop ];

  xdg.config.files."btop/btop.conf".source = ./btop.conf;
}
