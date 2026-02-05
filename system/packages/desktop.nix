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
  
  programs.niri.enable = true;

  programs.dms-shell = {
    enable = true;
    systemd.enable = false;
    quickshell.package = (pkgs.callPackage "${sources.quickshell.src}/default.nix" {});
  };
}
