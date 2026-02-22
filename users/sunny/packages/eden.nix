{
  stdenvNoCC,
  makeDesktopItem,
  fetchurl,
}:
let
  sourcesJson = builtins.fromJSON (builtins.readFile ../../../various/_sources/generated.json);

  pname = "eden";
  version = sourcesJson.eden.version;

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
