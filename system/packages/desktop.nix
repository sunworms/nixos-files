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
    package = (pkgs.callPackage ../../mango.nix { inherit sources; }).override {
      scenefx = (pkgs.callPackage ../../scenefx.nix { inherit sources; });
    };
  };

  security.pam.services.gtklock = { };
}
