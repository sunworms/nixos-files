{ pkgs, ... }:

{
  services.blueman-applet = {
    enable = true;
    package = pkgs.blueman;
    systemdTargets = [
      "graphical-session.target"
    ];
  };
}
