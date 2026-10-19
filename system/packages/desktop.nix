{pkgs, ...}: {
  services.displayManager.ly.enable = true;

  programs.niri = {
    enable = true;
    useNautilus = false;
  };

  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-termfilechooser
  ];

  security.pam.services.gtklock = {};

  services.speechd.enable = false;
}
