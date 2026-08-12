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
