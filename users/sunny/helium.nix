{
  lib,
  appimageTools,
  makeWrapper,
  fetchurl,
}:
let
  sourcesJson = builtins.fromJSON (builtins.readFile ../../various/_sources/generated.json);
  pname = "helium";
  version = sourcesJson.helium.version;
  src = fetchurl {
    url = sourcesJson.helium.src.url;
    hash = sourcesJson.helium.src.sha256;
  };
  appimageContents = appimageTools.extract {
    inherit pname version src;
  };
in
appimageTools.wrapType2 {
  inherit pname version src;

  nativeBuildInputs = [ makeWrapper ];

  extraInstallCommands = ''
    wrapProgram $out/bin/${pname} \
        --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --enable-wayland-ime=true}}"

    install -m 444 -D ${appimageContents}/${pname}.desktop -t $out/share/applications
    cp -r ${appimageContents}/usr/share/icons $out/share
  '';

  extraBwrapArgs = [
    "--ro-bind-try /etc/chromium/policies/managed/default.json /etc/chromium/policies/managed/default.json"
    "--ro-bind-try /etc/xdg/ /etc/xdg/"
  ];

  meta = {
    description = "Private, fast, and honest web browser";
    homepage = "https://helium.computer/";
    maintainers = [ lib.maintainers.sunworms ];
    platforms = [
      "x86_64-linux"
      "aarch64-linux"
    ];
  };
}
