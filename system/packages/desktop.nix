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

  programs.umbriel.enable = true;

  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-termfilechooser
  ];

  services.speechd.enable = false;
}
