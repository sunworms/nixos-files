{ config, lib, pkgs, ... }:

{
  services = {
    libinput.enable = true;

    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --cmd niri-session";
        };
      };
    };
  };
  programs.niri.enable = true;
}
