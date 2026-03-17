{ pkgs, ... }:

{
  packages = [
    (pkgs.symlinkJoin {
      name = "helium-wrapped";
      buildInputs = [ pkgs.makeWrapper ];
      paths = [ (pkgs.callPackage ./helium.nix { }) ];
      postBuild = ''
        wrapProgram $out/bin/helium \
          --append-flags "--no-first-run" \
          --append-flags "--proxy-server='socks5://localhost:40000'"
      '';
      meta.mainProgram = "helium";
    })
  ];
}
