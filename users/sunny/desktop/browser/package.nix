{
  formats,
  appimageTools,
  makeWrapper,
  inputs,
}: let
  pname = "helium";
  version = inputs._meta.helium.version;
  src = inputs.helium;
  appimageContents = appimageTools.extract {
    inherit pname version src;
  };
in
  appimageTools.wrapType2 {
    inherit pname version src;

    nativeBuildInputs = [makeWrapper];

    extraInstallCommands = ''
      wrapProgram $out/bin/${pname} \
          --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --enable-wayland-ime=true --gtk-version=4}}"

      install -m 444 -D ${appimageContents}/${pname}.desktop -t $out/share/applications
      cp -r ${appimageContents}/usr/share/icons $out/share
    '';

    extraBwrapArgs = [
      "--ro-bind-try ${(formats.json {}).generate "policies.json" (import ./preferences.nix)} /etc/chromium/policies/managed/default.json"
      "--ro-bind-try /etc/xdg/ /etc/xdg/"
    ];

    meta = {
      description = "Private, fast, and honest web browser";
      homepage = "https://helium.computer/";
      platforms = [
        "x86_64-linux"
        "aarch64-linux"
      ];
    };
  }
