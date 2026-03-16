{ pkgs, ... }:

{
  nix = {
    package = pkgs.lixPackageSets.git.lix;
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
