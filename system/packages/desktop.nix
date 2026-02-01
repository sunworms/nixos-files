{ pkgs, ... }:

{
  services.greetd = {
    enable = true;
    useTextGreeter = true;
    settings = {
      default-session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session";
      };
    };
  };
  
  programs.mango.enable = true;

  services.desktopManager.budgie.enable = false;
}
