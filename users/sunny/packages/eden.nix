{
  stdenvNoCC,
  makeDesktopItem,
  sources,
  lib,
}:
let
  sourcesJson = builtins.fromJSON (builtins.readFile ../../../various/_sources/generated.json);

  pname = "eden";
  rawVersion = sources.eden-nightly.version;
  baseName = baseNameOf rawVersion;
  version = lib.removePrefix "Eden-Linux-" baseName;

  desktopItem = makeDesktopItem {
    type = "Application";
    name = "Eden";
    desktopName = "Eden";
    genericName = "Eden Nightly";
    comment = "Nightly Build of Nintendo Switch 1 Emulator";
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

  src = sources.eden-nightly.src;

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
