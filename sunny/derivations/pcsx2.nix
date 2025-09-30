{ appimageTools, fetchurl }:
let
  pname = "pcsx2";
  version = "2.5.186";

  src = fetchurl {
    url = "https://github.com/PCSX2/${pname}/releases/download/v${version}/${pname}-v${version}-linux-appimage-x64-Qt.AppImage";
    hash = "sha256-+MGglqL4vNXhVIlesCaK/U+XnpfHsj7RWDbicI7horQ=";
  };
in
appimageTools.wrapType2 { inherit pname version src; }
