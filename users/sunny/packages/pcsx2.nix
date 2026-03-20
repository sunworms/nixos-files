{
  appimageTools,
  lib,
  fetchurl,
}:
let
  sourcesJson = builtins.fromJSON (builtins.readFile ../../../various/_sources/generated.json);

  pname = "pcsx2";
  version = lib.removePrefix "v" sourcesJson.pcsx2.version;

  src = fetchurl {
    url = sourcesJson.pcsx2.src.url;
    hash = sourcesJson.pcsx2.src.sha256;
  };

  appimageContents = appimageTools.extract { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    mkdir -p $out/share/applications
    mkdir -p $out/share/icons/hicolor/512x512/apps
    install -m 444 -D ${appimageContents}/net.pcsx2.PCSX2.desktop $out/share/applications/pcsx2.desktop
    install -m 444 -D ${appimageContents}/usr/share/icons/hicolor/512x512/apps/PCSX2.png $out/share/icons/hicolor/512x512/apps/PCSX2.png
    substituteInPlace $out/share/applications/pcsx2.desktop \
      --replace-fail 'Exec=pcsx2-qt' 'Exec=pcsx2'
  '';
}
