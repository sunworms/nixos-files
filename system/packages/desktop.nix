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
    package = (pkgs.niri.overrideAttrs rec {
      src = sources.niri-blur.src;
      doCheck = false;
      doInstallCheck = false;
      postPatch = ''
        patchShebangs resources/niri-session
        substituteInPlace resources/niri.service \
          --replace-fail 'ExecStart=' "ExecStart=$out/bin/"
      '';
      cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
        inherit src;
        hash = "sha256-+6z8UpAZJp5A65S0MiS+mrxj4xcbYIH0TEYYPl60bUM=";
      };
    });
  };

  programs.dms-shell = {
    enable = true;
    systemd.enable = false;
    quickshell.package = (pkgs.callPackage sources.quickshell.src { });
  };
}
