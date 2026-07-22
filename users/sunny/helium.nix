{
  lib,
  stdenv,
  fetchurl,
  makeWrapper,
  autoPatchelfHook,
  qt6,
  glib,
  gdk-pixbuf,
  gtk3,
  nspr,
  nss,
  dbus,
  atk,
  at-spi2-atk,
  cups,
  expat,
  libxcb,
  libxkbcommon,
  at-spi2-core,
  libx11,
  libxcomposite,
  libxdamage,
  libxext,
  libxfixes,
  libxrandr,
  mesa,
  cairo,
  pango,
  systemd,
  alsa-lib,
  libdrm,
  libGL,
  libva,
  pipewire,
  libpulseaudio,
}: let
  sourcesJson = builtins.fromJSON (builtins.readFile ../../_sources/generated.json);
in
  stdenv.mkDerivation {
    pname = "helium";
    version = sourcesJson.helium.version;

    src = fetchurl {
      url = sourcesJson.helium.src.url;
      hash = sourcesJson.helium.src.sha256;
    };

    nativeBuildInputs = [
      makeWrapper
      autoPatchelfHook
    ];

    buildInputs = [
      glib
      gdk-pixbuf
      gtk3
      nspr
      nss
      dbus
      atk
      at-spi2-atk
      cups
      expat
      libxcb
      libxkbcommon
      at-spi2-core
      libx11
      libxcomposite
      libxdamage
      libxext
      libxfixes
      libxrandr
      mesa
      cairo
      pango
      systemd
      alsa-lib
      libdrm
      qt6.qtbase
    ];

    dontWrapQtApps = true;

    autoPatchelfIgnoreMissingDeps = [
      "libQt5Core.so.5"
      "libQt5Gui.so.5"
      "libQt5Widgets.so.5"
    ];

    installPhase = ''
      runHook preInstall
      mkdir --parents $out/opt/helium
      cp --recursive ./* $out/opt/helium/

      mkdir --parents $out/bin
      makeWrapper $out/opt/helium/helium-wrapper $out/bin/helium \
        --prefix LD_LIBRARY_PATH : "${
        lib.makeLibraryPath [
          libGL
          libva
          pipewire
          libpulseaudio
          gtk3
          qt6.qtbase
        ]
      }"

      mkdir --parents $out/share/applications
      cp $out/opt/helium/helium.desktop $out/share/applications/

      mkdir --parents $out/share/pixmaps
      cp $out/opt/helium/product_logo_256.png $out/share/pixmaps/helium.png
      runHook postInstall
    '';

    meta = {
      platforms = ["x86_64-linux"];
      description = "A private, fast, and honest web browser";
      homepage = "https://github.com/imputnet/helium";
      license = lib.licenses.gpl3Only;
      mainProgram = "helium";
    };
  }
