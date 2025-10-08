{ config, lib, pkgs, ... }:

{
  services.mako = {
    enable = true;
    settings = {
      border-size = 1;
      default-timeout = 10000;
    };
  };

  services.swayidle = {
    enable = true;
    timeouts = [
      { timeout = 300; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
      { timeout = 600; command = "${pkgs.systemd}/bin/systemctl suspend"; }
    ];
    events = [
      { event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
    ];
    systemdTarget = "graphical-session.target";
  };

  services.cliphist = {
    enable = true;
    allowImages = true;
    systemdTargets = [ "graphical-session.target" ];
  };

  services.swww.enable = true;

  programs.swaylock = {
    enable = true;
    settings = {
      daemonize = true;
      ignore-empty-password = true;
      font-size = 14;
    };
  };
}
