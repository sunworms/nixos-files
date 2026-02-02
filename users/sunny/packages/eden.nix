{
  stdenvNoCC,
  fetchurl,
  makeDesktopItem,
}:
let
  hashJson = builtins.fromJSON (builtins.readFile ../../../various/hashes.json);

  pname = "eden";
  version = hashJson.pins.eden-nightly.version;
  # Extract commit hash from version tag (e.g., v1769981453.cd9527072d -> cd9527072d)
  commit = builtins.head (builtins.match ".*\\.([a-f0-9]+)" version);

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
    commit
    desktopItem
    ;

  src = fetchurl {
    url = "https://github.com/Eden-CI/Nightly/releases/download/${version}/Eden-Linux-${commit}-amd64-clang-pgo.AppImage";
    hash = hashJson.pins.eden-nightly.hash;
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
