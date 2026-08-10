{
  pkgs,
  lib,
  inputs,
  ...
}: let
  rafTuigreet = pkgs.stdenvNoCC.mkDerivation {
    pname = "tuigreet";
    version = inputs.tuigreet.version;
    src = inputs.tuigreet.src;
    dontUnpack = true;
    buildInputs = with pkgs; [
      libgcc
    ];
    nativeBuildInputs = with pkgs; [
      autoPatchelfHook
    ];
    installPhase = ''
      runHook preinstall
      install -Dm755 $src $out/bin/tuigreet
      runHook postInstall
    '';
    meta.mainProgram = "tuigreet";
  };
in {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${lib.getExe rafTuigreet} --time --remember --remember-session";
        user = "greeter";
      };
    };
    useTextGreeter = true;
  };

  programs.mango = {
    enable = true;
    package = pkgs.mango;
  };

  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      mango = {
        prettyName = "Mango";
        comment = "Mango compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/mango";
      };
    };
  };
}
