{pkgs, ...}: {
  nix = {
    package = pkgs.nixVersions.latest;
    channel.enable = false;
    settings = {
      max-jobs = 4;
      cores = 6;
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
