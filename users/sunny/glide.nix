{
  lib,
  stdenv,
  config,
  writeText,
  # Build/Packaging Tools
  autoPatchelfHook,
  copyDesktopItems,
  makeBinaryWrapper,
  makeDesktopItem,
  patchelfUnstable,
  wrapGAppsHook3,
  nix-update-script,
  # Core Libs
  alsa-lib,
  at-spi2-atk,
  atk,
  cairo,
  curl,
  dbus,
  dbus-glib,
  ffmpeg_7,
  gdk-pixbuf,
  glib,
  gsettings-desktop-schemas,
  gtk3,
  libcanberra-gtk3,
  libGL,
  libdrm,
  libgbm,
  libnotify,
  libpulseaudio,
  librsvg,
  libva,
  libxkbcommon,
  mesa,
  pango,
  pciutils,
  pipewire,
  speechd-minimal,
  udev,
  vulkan-loader,
  wayland,
  libX11,
  libXcomposite,
  libXdamage,
  libXext,
  libXfixes,
  libXrandr,
  libxcb,
  policies ? { },
  sources,
  ...
}:
let
  sourcesJson = builtins.fromJSON (builtins.readFile ../../various/_sources/generated.json);

  appId = "glide-browser";

  # These libraries are dlopen()'ed by the browser executable at runtime.
  # They MUST be in LD_LIBRARY_PATH for features to work.
  runtimeLibs = [
    # Core GUI & IPC
    libGL
    libcanberra-gtk3
    libdrm
    libgbm
    libnotify
    libxkbcommon
    wayland
    dbus
    dbus-glib
    gtk3
    glib
    cairo
    pango
    gdk-pixbuf
    atk
    at-spi2-atk

    # Media (Microphone & Audio)
    pipewire
    libpulseaudio
    alsa-lib
    speechd-minimal

    # Hardware Acceleration & Codecs
    ffmpeg_7
    libva
    mesa
    vulkan-loader
    udev

    # X11 Compatibility
    libX11
    libXcomposite
    libXdamage
    libXext
    libXfixes
    libXrandr
    libxcb
  ];

  firefoxPolicies = (config.firefox.policies or { }) // policies;

  policiesJson = writeText "firefox-policies.json" (builtins.toJSON { policies = firefoxPolicies; });
in
stdenv.mkDerivation (finalAttrs: {
  pname = "glide-browser";

  version = sourcesJson.glide.version;

  src = sources.glide.src;

  nativeBuildInputs = [
    copyDesktopItems
    makeBinaryWrapper
    autoPatchelfHook
    patchelfUnstable
    wrapGAppsHook3
  ];

  buildInputs = (
    runtimeLibs
    ++ [
      speechd-minimal
      pciutils
      curl
      gsettings-desktop-schemas
      librsvg
    ]
  );

  runtimeDependencies = runtimeLibs;

  appendRunpaths = [
    "${lib.getLib pipewire}/lib"
    "${lib.getLib libGL}/lib"
    "${lib.getLib udev}/lib"
  ];

  patchelfFlags = [ "--no-clobber-old-sections" ];

  preFixup = ''
    gappsWrapperArgs+=(
      # Explicitly inject runtime libraries. 
      --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath runtimeLibs}"

      --set MOZ_APP_LAUNCHER "${appId}"
      --set MOZ_LEGACY_PROFILES 1
      --set MOZ_ALLOW_DOWNGRADE 1
      --set-default MOZ_ENABLE_WAYLAND 1
      
      # Required for the window manager to associate the window correctly
      --add-flags "--name=${appId}"
      --add-flags "--class=${appId}"
    )
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin $out/share/icons/hicolor/ $out/lib/glide-browser-bin-${finalAttrs.version}
    cp -t $out/lib/glide-browser-bin-${finalAttrs.version} -r *

    # Ensure binaries are executable for patchelf
    chmod +x $out/lib/glide-browser-bin-${finalAttrs.version}/glide

    iconDir=$out/share/icons/hicolor
    browserIcons=$out/lib/glide-browser-bin-${finalAttrs.version}/browser/chrome/icons/default

    for i in 16 32 48 64 128; do
      iconSizeDir="$iconDir/''${i}x$i/apps"
      mkdir -p $iconSizeDir
      cp $browserIcons/default$i.png $iconSizeDir/${appId}.png
    done

    ln -s $out/lib/glide-browser-bin-${finalAttrs.version}/glide $out/bin/glide
    ln -s $out/bin/glide $out/bin/${appId}

    mkdir -p $out/lib/glide-browser-bin-${finalAttrs.version}/distribution/
    ln -s ${policiesJson} "$out/lib/glide-browser-bin-${finalAttrs.version}/distribution/policies.json"

    runHook postInstall
  '';

  desktopItems = [
    (makeDesktopItem {
      name = appId;
      exec = "${appId} --name ${appId} %U";
      icon = appId;
      desktopName = "Glide Browser";
      genericName = "Web Browser";
      terminal = false;
      startupNotify = true;
      startupWMClass = appId;
      categories = [
        "Network"
        "WebBrowser"
      ];
      mimeTypes = [
        "text/html"
        "text/xml"
        "application/xhtml+xml"
        "application/vnd.mozilla.xul+xml"
        "x-scheme-handler/http"
        "x-scheme-handler/https"
      ];
      actions = {
        new-window = {
          name = "New Window";
          exec = "${appId} --new-window %U";
        };
        new-private-window = {
          name = "New Private Window";
          exec = "${appId} --private-window %U";
        };
        profile-manager-window = {
          name = "Profile Manager";
          exec = "${appId} --ProfileManager";
        };
      };
    })
  ];

  passthru.updateScript = nix-update-script {
    extraArgs = [
      "--url"
      "https://github.com/glide-browser/glide"
    ];
  };

  meta = {
    changelog = "https://glide-browser.app/changelog#${finalAttrs.version}";
    description = "Extensible and keyboard-focused web browser, based on Firefox (binary package)";
    homepage = "https://glide-browser.app/";
    license = lib.licenses.mpl20;
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
    platforms = [
      "x86_64-linux"
    ];
    maintainers = with lib.maintainers; [ pyrox0 ];
    mainProgram = appId;
  };
})
