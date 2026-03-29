{ pkgs, ... }:

{
  nix = {
    package = pkgs.nixVersions.git;
    channel.enable = false;
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "flakes"
        "nix-command"
      ];
      trusted-users = [
        "sunny"
      ];
      substituters = [
        "https://noctalia.cachix.org"
      ];
      trusted-public-keys = [
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      ];
    };
  };
}
