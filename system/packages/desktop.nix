{ pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.cage}/bin/cage -s -- ${pkgs.regreet}/bin/regreet";
      };
    };
  };

  programs.regreet.enable = true;

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  programs.mango.enable = true;
}
