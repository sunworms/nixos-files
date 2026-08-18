{
  appimageTools,
  icu,
  inputs,
  assets,
}: let
  pname = "ryujinx";
  version = inputs.ryujinx.version;

  src = inputs.ryujinx.src;

  appimageContents = appimageTools.extract {inherit pname version src;};
in
  appimageTools.wrapType2 {
    inherit pname version src;

    extraPkgs = pkgs: [
      icu
    ];

    extraInstallCommands = ''
      mkdir -p $out/share/applications
      install -m 444 -D ${appimageContents}/app.ryujinx.Ryujinx.desktop $out/share/applications/ryujinx.desktop
      substituteInPlace $out/share/applications/ryujinx.desktop \
        --replace-fail 'Exec=Ryujinx.sh' 'Exec=ryujinx' \
        --replace-fail 'Icon=app.ryujinx.Ryujinx' 'Icon=${assets}/ryujinx.png'
    '';

    extraBwrapArgs = [
      "--setenv AVALONIA_GLOBAL_SCALE_FACTOR 1.75"
    ];
  }
