{ pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session";
      };
    };
    useTextGreeter = true;
  };

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };
}
