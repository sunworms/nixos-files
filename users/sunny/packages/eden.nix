{
  stdenvNoCC,
  makeDesktopItem,
  fetchurl,
  lib,
}:
let
  sourcesJson = builtins.fromJSON (builtins.readFile ../../../_sources/generated.json);

  pname = "eden";
  rawVersion = sourcesJson.eden.version;
  baseName = baseNameOf rawVersion;
  version = lib.removePrefix "Eden-Linux-" baseName;

  desktopItem = makeDesktopItem {
    type = "Application";
    name = "Eden";
    desktopName = "Eden";
    genericName = "Eden";
    comment = "Nintendo Switch 1 Emulator";
    exec = "eden";
    icon = "${../../../assets/icons/eden.svg}";
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

  src = fetchurl {
    url = sourcesJson.eden.src.url;
    hash = sourcesJson.eden.src.sha256;
  };

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
