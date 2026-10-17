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
        "pipe-operators"
      ];
      trusted-users = [
        "@wheel"
      ];
      substituters = ["https://cache.manic.systems"];
      trusted-public-keys = ["cache.manic.systems-1:s6OZanN8Us8vRi0jVivP3qlMn0cYHBjBALKrNe5nH8s="];
    };
  };
}
