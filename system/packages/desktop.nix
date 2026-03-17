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
    package = inputs.niri-blur.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };

  programs.dank-material-shell = {
    enable = true;
    systemd.enable = true;
    plugins = {
      emojiLauncher.enable = true;
      niriWindows.enable = true;
    };
  };
}
