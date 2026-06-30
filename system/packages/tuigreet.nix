{
  stdenvNoCC,
  fetchurl,
  autoPatchelfHook,
  libgcc,
}:

let
  sourcesJson = builtins.fromJSON (builtins.readFile ../../_sources/generated.json);
  version = sourcesJson.tuigreet.version;
  pname = "tuigreet";
in
stdenvNoCC.mkDerivation {
  inherit pname version;

  src = fetchurl {
    url = sourcesJson.tuigreet.src.url;
    hash = sourcesJson.tuigreet.src.sha256;
  };

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [
    libgcc
  ];

  dontUnpack = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D $src $out/bin/tuigreet
    runHook postInstall
  '';
}
