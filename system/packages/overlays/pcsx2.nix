{ lib, appimageTools, fetchurl }:

let
  pname = "pcsx2";
  version = "2.5.174";

  src = fetchurl {
    url = "https://github.com/PCSX2/${pname}/releases/download/v${version}/${pname}-v${version}-linux-appimage-x64-Qt.AppImage";
    hash = "sha256-CrZwT1sG3mMmwHgSe/ykDbFbwu6YQ5WYPNLBi09v0uY=";
  };
in
appimageTools.wrapType2 {
  inherit pname version src;
}
