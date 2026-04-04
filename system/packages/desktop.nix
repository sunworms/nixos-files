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
    package = (
      inputs.niri-blur.packages.${pkgs.stdenv.hostPlatform.system}.default.overrideAttrs {
        doCheck = false;
      }
    );
  };
}
