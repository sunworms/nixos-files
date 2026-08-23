{
  stdenvNoCC,
  unzip,
  inputs,
}:
stdenvNoCC.mkDerivation {
  pname = "iosevka-nerd";
  version = inputs.iosevka-nerd.version;

  src = inputs.iosevka-nerd.src;

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
