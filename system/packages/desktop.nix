{
  pkgs,
  lib,
  ...
}: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "/usr/bin/env XCURSOR_SIZE=48 XCURSOR_THEME=volantes_cursors QT_SCALE_FACTOR=1.75 ${lib.getExe pkgs.cage} -s -d -- ${lib.getExe pkgs.qtgreet}";
        user = "greeter";
      };
    };
  };

  # let greeter user access ~/.face
  systemd.tmpfiles.rules = [
    "z /home/sunny 711 sunny users -"
  ];

  environment.systemPackages = with pkgs; [
    volantes-cursors
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
    useNautilus = false;
  };

  services.speechd.enable = false;
}
