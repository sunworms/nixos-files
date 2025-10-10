{ appimageTools, fetchurl }:
let
  pname = "pcsx2";
  version = "2.5.215";

  src = fetchurl {
    url = "https://github.com/PCSX2/${pname}/releases/download/v${version}/${pname}-v${version}-linux-appimage-x64-Qt.AppImage";
    hash = "sha256-pA5FH/sW7rh9/Xe4tei7BC/0XsDGLQc52S/Cw6fgydw=";
  };
in
appimageTools.wrapType2 { inherit pname version src; }
