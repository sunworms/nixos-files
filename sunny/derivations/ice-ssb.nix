{ stdenvNoCC,
  lib,
  fetchurl,
  python3Packages,
  autoPatchelfHook,
  pkgs
}:

stdenvNoCC.mkDerivation rec {
  pname = "ice-ssb";
  version = "6.0.8";

  src = fetchurl {
    url = "https://github.com/peppermintos/ice/archive/v${version}.tar.gz";
    hash = "sha256-l477L7hEf9HcletclL/4cq/h5D6aaV7vd/JojYL/kLA=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    python3Packages.wrapPython
  ];

  buildInputs = with pkgs; [
    gobject-introspection
    gtk3
    wrapGAppsHook3
  ];

  propagatedBuildInputs = with python3Packages; [
    beautifulsoup4
    pygobject3
    lxml
    requests
  ];

  sourceRoot = ".";

  postPatch = ''
    substituteInPlace ice-${version}/usr/bin/ice \
      --replace "/usr/share/pixmaps/ice.png" "$out/share/pixmaps/ice.png" \
      --replace "/usr/bin/firefox" "${pkgs.firefox}/bin/firefox"
    substituteInPlace ice-${version}/usr/bin/ice-firefox \
      --replace "/usr/share/pixmaps/ice.png" "$out/share/pixmaps/ice.png" \
      --replace "/usr/bin/firefox" "${pkgs.firefox}/bin/firefox"
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp -r -f ice-${version}/usr/bin/* $out/bin
    chmod +x $out/bin/*

    mkdir -p $out/lib
    cp -r -f ice-${version}/usr/lib/* $out/lib

    mkdir -p $out/share
    cp -r -f ice-${version}/usr/share/* $out/share

    wrapPythonProgramsIn $out/bin "$propagatedBuildInputs"
  '';
}
