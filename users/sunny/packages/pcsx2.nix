{
  appimageTools,
  fetchurl,
  lib,
}:
let
  hashJson = builtins.fromJSON (builtins.readFile ../../../various/hashes.json);

  pname = "pcsx2";
  version = lib.removePrefix "v" hashJson.pins.pcsx2.version;

  src = fetchurl {
    url = "https://github.com/PCSX2/${pname}/releases/download/v${version}/${pname}-v${version}-linux-appimage-x64-Qt.AppImage";
    hash = hashJson.pins.pcsx2.hash;
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
