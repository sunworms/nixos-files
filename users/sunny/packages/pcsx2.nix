{
  appimageTools,
  lib,
  fetchurl,
  qt6Packages,
  sources,
  assets,
}: let
  pname = "pcsx2";
  version = lib.removePrefix "v" sources.pcsx2.version;

  src = fetchurl {
    url = sources.pcsx2.src.url;
    hash = sources.pcsx2.src.sha256;
  };

  appimageContents = appimageTools.extract {inherit pname version src;};

  qtPluginPrefix = qt6Packages.qtbase.qtPluginPrefix;
in
  appimageTools.wrapType2 {
    inherit pname version src;

    extraPackages = [
      qt6Packages.qt6ct
    ];

    extraInstallCommands = ''
      mkdir -p $out/share/applications
      install -m 444 -D ${appimageContents}/net.pcsx2.PCSX2.desktop $out/share/applications/pcsx2.desktop
      substituteInPlace $out/share/applications/pcsx2.desktop \
        --replace-fail 'Exec=pcsx2-qt' 'Exec=pcsx2' \
        --replace-fail 'Icon=PCSX2' 'Icon=${assets}/pcsx2.png'
    '';

    extraBwrapArgs = [
      "--setenv QT_QPA_PLATFORMTHEME qt6ct"
      "--setenv QT_PLUGIN_PATH ${qt6Packages.qt6ct}/${qtPluginPrefix}"
    ];
  }
