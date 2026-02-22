{ pkgs, inputs, ... }:

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
    package = inputs.niri-git.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };

  security.pam.services.gtklock = { };
}
