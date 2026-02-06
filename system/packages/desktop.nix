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
      src = sources.niri.src;
      
      cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
        inherit src;
        hash = "sha256-npBgmeZIg3JKAXGq79zXlkYdtpHTfgjIQmDZ17H6E4c=";
      };

      postPatch = ''
        patchShebangs resources/niri-session
        substituteInPlace resources/niri.service \
          --replace-fail 'ExecStart=' "ExecStart=$out/bin/"
      '';

      doCheck = false;
      doInstallCheck = false;
    });
  };

  programs.dms-shell = {
    enable = true;
    systemd.enable = false;
    quickshell.package = (pkgs.callPackage "${sources.quickshell.src}/default.nix" {});
  };
}
