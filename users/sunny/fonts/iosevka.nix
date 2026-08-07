{
  stdenvNoCC,
  fetchurl,
  unzip,
  sources,
}:
stdenvNoCC.mkDerivation {
  pname = "iosevka-custom";
  version = sources.iosevka-custom.version;

  src = fetchurl {
    url = sources.iosevka-custom.src.url;
    hash = sources.iosevka-custom.src.sha256;
  };

  nativeBuildInputs = [
    unzip
  ];

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/truetype
    mv *.ttf $out/share/fonts/truetype/

    runHook postInstall
  '';
}
