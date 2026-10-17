{
  stdenvNoCC,
  makeDesktopItem,
  inputs,
  assets,
}: let
  pname = "eden";
  version = inputs._meta.eden.version;

  desktopItem = makeDesktopItem {
    type = "Application";
    name = "Eden";
    desktopName = "Eden";
    genericName = "Eden";
    comment = "Nintendo Switch 1 Emulator";
    exec = "eden";
    icon = "${assets}/eden.png";
    terminal = false;
    startupNotify = true;
    categories = [
      "Game"
      "Emulator"
    ];
  };
in
  stdenvNoCC.mkDerivation {
    inherit
      pname
      version
      desktopItem
      ;

    src = inputs.eden;

    dontUnpack = true;
    dontBuild = true;
    dontStrip = true;

    installPhase = ''
      runHook preInstall

      mkdir -p $out/bin
      mkdir -p $out/share
      install -Dm755 $src $out/bin/eden
      install -Dm644 ${desktopItem}/share/applications/* $out/share/applications/${pname}.desktop

      runHook postInstall
    '';
  }
