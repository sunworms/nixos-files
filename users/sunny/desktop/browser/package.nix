{
  lib,
  stdenvNoCC,
  makeWrapper,
  autoPatchelfHook,
  writeTextDir,
  bubblewrap,
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
  inputs,
}: let
  policyDir = writeTextDir "policies/managed/helium.json" (builtins.toJSON (import ./preferences.nix));

  ldLibraryPath = lib.makeLibraryPath [
    libGL
    libva
    pipewire
    libpulseaudio
    gtk3
    qt6.qtbase
  ];
in
  stdenvNoCC.mkDerivation {
    pname = "helium";
    version = inputs.helium.version;

    src = inputs.helium.src;

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
      makeWrapper ${lib.getExe bubblewrap} $out/bin/helium \
        --prefix LD_LIBRARY_PATH : "${ldLibraryPath}" \
        --add-flags "--dev-bind" \
        --add-flags "/" \
        --add-flags "/" \
        --add-flags "--dir" \
        --add-flags "/etc/chromium" \
        --add-flags "--bind" \
        --add-flags "${policyDir}" \
        --add-flags "/etc/chromium" \
        --add-flags "$out/opt/helium/helium-wrapper"

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
