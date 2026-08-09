{
  stdenvNoCC,
  unzip,
  inputs,
}:
stdenvNoCC.mkDerivation {
  pname = "iosevka-custom";
  version = inputs.iosevka-custom.version;

  src = inputs.iosevka-custom.src;

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
