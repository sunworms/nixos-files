{ pkgs, ... }:

let
  helium-base = pkgs.callPackage ./helium.nix { };

  helium-proxied = pkgs.symlinkJoin {
    name = "helium-proxied";
    paths = [ helium-base ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/helium \
        --add-flags "--no-first-run" \
        --add-flags "--proxy-server='socks5://localhost:40000'"

      mkdir -p $out/share/applications
      substitute ${helium-base}/share/applications/helium.desktop \
        $out/share/applications/helium-proxy.desktop \
        --replace-warn "Name=Helium" "Name=Helium (Proxy)" \
        --replace-warn "Exec=helium" "Exec=$out/bin/helium"
    '';
  };
in
{
  packages = [
    helium-base
    helium-proxied
  ];
}
