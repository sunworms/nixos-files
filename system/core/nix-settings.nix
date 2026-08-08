{pkgs, ...}: {
  nix = {
    package = pkgs.nixVersions.latest;
    channel.enable = false;
    settings = {
      tarball-ttl = 2592000; # make the tarballs last longer
      auto-optimise-store = true;
      experimental-features = [
        "flakes"
        "nix-command"
      ];
      trusted-users = [
        "@wheel"
      ];
      substituters = [];
      trusted-public-keys = [];
    };
  };
}
