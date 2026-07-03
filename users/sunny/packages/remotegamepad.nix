{
  stdenv,
  fetchurl,
  autoPatchelfHook,
  libX11,
  libXext,
  libXi,
  libXrender,
  libXtst,
  fontconfig,
  freetype,
  alsa-lib,
  zlib,
  libGL,
}:

stdenv.mkDerivation {
  pname = "remotegamepad";
  version = "1.0.0";

  src = fetchurl {
    url = "https://download.remotegamepad.com/remotegamepad_amd64.tar.gz";
    hash = "sha256-J4iFBH8F1wEK91nVG/zYBTM330mZ8g1P6HmmN4LIxfg=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [
    libX11
    libXext
    libXi
    libXrender
    libXtst

    fontconfig
    freetype
    alsa-lib
    zlib

    libGL
    stdenv.cc.cc.lib
  ];

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall

    install -Dm755 remotegamepad $out/bin/remotegamepad
    cp -r adb $out/bin
    cp *.so $out/bin
    cp -r lib $out/bin

    runHook postInstall
  '';
}
