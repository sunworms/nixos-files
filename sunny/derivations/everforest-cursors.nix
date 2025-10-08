{ stdenvNoCC, fetchurl }:

let
  pname = "everforest-cursors";
  version = "3212590527";
in
stdenvNoCC.mkDerivation {
  inherit pname version;

  src = fetchurl {
    url = "https://github.com/talwat/${pname}/releases/download/${version}/everforest-cursors-variants.tar.bz2";
    hash = "sha256-xXgtN9wbjbrGLUGYymMEGug9xEs9y44mq18yZVdbiuU=";
  };

  sourceRoot = ".";

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r ${pname} $out/share/icons
    cp -r ${pname}-light $out/share/icons
  '';
}
