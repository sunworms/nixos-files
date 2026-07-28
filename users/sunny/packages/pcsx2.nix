{
  appimageTools,
  lib,
  fetchurl,
  qt6Packages,
}: let
  sourcesJson = builtins.fromJSON (builtins.readFile ../../../_sources/generated.json);

  pcsx2-icon = fetchurl {
    url = "https://avatars.githubusercontent.com/u/6278711";
    hash = "sha256-6Pb8WnFtQ/YihH5C8EwgeZv1GaqeKi3/yXBMj6R8LHI=";
  };

  pname = "pcsx2";
  version = lib.removePrefix "v" sourcesJson.pcsx2.version;

  src = fetchurl {
    url = sourcesJson.pcsx2.src.url;
    hash = sourcesJson.pcsx2.src.sha256;
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
        --replace-fail 'Icon=PCSX2' 'Icon=${pcsx2-icon}'
    '';

    extraBwrapArgs = [
      "--setenv QT_QPA_PLATFORMTHEME qt6ct"
      "--setenv QT_PLUGIN_PATH ${qt6Packages.qt6ct}/${qtPluginPrefix}"
    ];
  }
