{ pkgs, sources, ... }:

{
  services.greetd = {
    enable = true;
    useTextGreeter = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session";
      };
    };
  };

  programs.mangowc = {
    enable = true;
    package = pkgs.mangowc;
  };

  security.pam.services.gtklock = { };
}
