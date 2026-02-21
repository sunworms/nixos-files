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
    package = (
      pkgs.niri.overrideAttrs rec {
        src = sources.niri-blur.src;
        postPatch = ''
          patchShebangs resources/niri-session
          substituteInPlace resources/niri.service \
            --replace-fail 'ExecStart=' "ExecStart=$out/bin/"
        '';
        cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
          inherit src;
          hash = "sha256-uo4AWT4nGV56iiSLhXK30goI7HCPc7AUZjRLgUvLfUE=";
        };
        doCheck = false;
        doInstallCheck = false;
      }
    );
  };

  security.pam.services.gtklock = { };
}
