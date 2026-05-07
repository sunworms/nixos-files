{ pkgs, ... }:

{
  services.displayManager.ly.enable = true;

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  security.pam.services.gtklock = { };
}
