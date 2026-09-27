{
  pkgs,
  lib,
  ...
}: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${lib.getExe pkgs.tuigreet} --time --remember --remember-session";
        user = "greeter";
      };
    };
    useTextGreeter = true;
  };

  programs.niri = {
    enable = true;
    useNautilus = false;
  };

  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-termfilechooser
  ];

  services.speechd.enable = false;
}
