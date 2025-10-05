{ config, lib, pkgs, ... }:

{
  services = {
    libinput.enable = true;
    displayManager.ly.enable = true;
  };

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };
}
