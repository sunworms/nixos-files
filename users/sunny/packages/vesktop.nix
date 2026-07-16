{
  appimageTools,
  fetchurl,
}:
let
  sourcesJson = builtins.fromJSON (builtins.readFile ../../../_sources/generated.json);

  pname = "vesktop";
  version = builtins.substring 0 7 sourcesJson.vesktop.version;

  src = fetchurl {
    url = sourcesJson.vesktop.src.url;
    hash = sourcesJson.vesktop.src.sha256;
  };

  appimageContents = appimageTools.extract { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    mkdir -p $out/share/applications
    mkdir -p $out/share/icons/hicolor/scalable/apps
    install -m 444 -D ${appimageContents}/vesktop.desktop $out/share/applications/vesktop.desktop
    install -m 444 -D ${appimageContents}/vesktop.svg $out/share/icons/hicolor/scalable/apps/vesktop.svg
    substituteInPlace $out/share/applications/vesktop.desktop \
      --replace-fail 'Exec=AppRun' 'Exec=vesktop'
  '';
}
