{ pkgs, ... }:

{
  nix = {
    package = pkgs.nixVersions.git;
    channel.enable = false;
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
      ];
      trusted-users = [
        "sunny"
      ];
      substituters = [
      ];
      trusted-public-keys = [
      ];
    };
  };
}
