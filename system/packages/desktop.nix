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

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  programs.dms-shell = {
    enable = true;
    quickshell.package = (pkgs.callPackage sources.quickshell.src { });
  };

  programs.dsearch.enable = true;
}
