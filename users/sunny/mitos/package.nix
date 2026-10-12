{
  assets,
  inputs,
  autoPatchelfHook,
  stdenv,
  installShellFiles,
  makeDesktopItem,
}: let
  mitosDesktopItem = makeDesktopItem {
    name = "Mitos";
    desktopName = "Mitos";
    genericName = "Text Editor";
    tryExec = "ms";
    exec = "ms %F";
    terminal = true;
    type = "Application";
    keywords = [
      "Text"
      "editor"
    ];
    icon = "${assets}/mitos.png";
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
in
  stdenv.mkDerivation {
    pname = "mitos";
    version = inputs.mitos.version;
    src = inputs.mitos.src;

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
      install -Dm755 ms $out/bin/ms
      cp -r runtime $out/bin/runtime

      runHook postInstall
    '';

    postInstall = ''
      installShellCompletion contrib/completion/ms.{bash,fish,zsh}
      mkdir -p $out/share/{applications,icons/hicolor/256x256/apps}
      install -Dm644 ${mitosDesktopItem}/share/applications/Mitos.desktop $out/share/applications/Mitos.desktop
      install -Dm644 ${assets}/mitos.png $out/share/icons/hicolor/256x256/apps/mitos.png
    '';
  }
