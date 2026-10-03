{
  assets,
  sources,
  autoPatchelfHook,
  stdenv,
  installShellFiles,
  makeDesktopItem,
  symlinkJoin,
  makeBinaryWrapper,
}: let
  helixDesktopItem = makeDesktopItem {
    name = "Helix";
    desktopName = "Helix";
    genericName = "Text Editor";
    tryExec = "hx";
    exec = "hx %F";
    terminal = false;
    type = "Application";
    keywords = [
      "Text"
      "editor"
    ];
    icon = "${assets}/helix.png";
    categories = [
      "Utility"
      "TextEditor"
      "ConsoleOnly"
    ];
    startupNotify = false;
    mimeTypes = [
      "text/english"
      "text/plain"
      "text/x-makefile"
      "text/x-c++hdr"
      "text/x-c++src"
      "text/x-chdr"
      "text/x-csrc"
      "text/x-java"
      "text/x-moc"
      "text/x-pascal"
      "text/x-tcl"
      "text/x-tex"
      "application/x-shellscript"
      "text/x-c"
      "text/x-c++"
    ];
  };

  helixUnwrapped = stdenv.mkDerivation {
    pname = "helix-unwrapped";
    version = sources.helix-fork.version;
    src = sources.helix-fork.src;

    buildInputs = [
      stdenv.cc.cc.lib
    ];

    nativeBuildInputs = [
      autoPatchelfHook
      installShellFiles
    ];

    installPhase = ''
      runHook preInstall

      mkdir -p $out/{bin,libexec}
      install -Dm755 hx $out/bin/hx
      cp -r runtime $out/libexec/runtime

      runHook postInstall
    '';

    postInstall = ''
      installShellCompletion contrib/completion/hx.{bash,fish,zsh}
      mkdir -p $out/share/{applications,icons/hicolor/256x256/apps}
      install -Dm644 ${helixDesktopItem}/share/applications/Helix.desktop $out/share/applications/Helix.desktop
      install -Dm644 ${assets}/helix.png $out/share/icons/hicolor/256x256/apps/helix.png
    '';
  };
in
  symlinkJoin {
    pname = "helix";
    inherit (helixUnwrapped) version;

    paths = [helixUnwrapped];
    nativeBuildInputs = [makeBinaryWrapper];

    postBuild = ''
      wrapProgram $out/bin/hx --set HELIX_RUNTIME "${helixUnwrapped}/libexec/runtime"
    '';

    meta.mainProgram = "hx";
  }
