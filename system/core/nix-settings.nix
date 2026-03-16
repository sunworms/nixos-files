{ pkgs, ... }:

{
  nix = {
    package = pkgs.nixVersions.git;
    channel.enable = false;
    settings = {
      experimental-features = [
        "flakes"
        "nix-command"
      ];
      trusted-users = [
        "sunny"
      ];
      substituters = [ ];
      trusted-public-keys = [ ];
    };
  };
}
