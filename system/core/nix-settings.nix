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
      substituters = [
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };
}
