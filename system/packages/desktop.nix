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
    package = (pkgs.callPackage ../../niri.nix { inherit sources; });
    useNautilus = false;
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
