{ lib, fetchurl, stdenvNoCC, pkgs, ... }:

stdenvNoCC.mkDerivation rec {
  pname = "yt-dlp";
  version = "2025.09.23";

  src = fetchurl {
    url = "https://github.com/${pname}/${pname}/releases/download/${version}/${pname}_linux";
    hash = "sha256-ydnV+FcZA9UXz1vfr7g2ZzvbMhxbvY+/BCKNFuOkJzk=";
  };

  dontUnpack = true;

  buildInputs = with pkgs; [
    zlib
  ];

  nativeBuildInputs = with pkgs; [
    autoPatchelfHook
    zlib
  ];

  installPhase = ''
    mkdir -p $out/bin
    install -Dm755 ${src} $out/bin/${pname}
  '';
}
