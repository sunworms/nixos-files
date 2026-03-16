{ pkgs, ... }:

{
  nix = {
    package = pkgs.lixPackageSets.git.lix;
    channel.enable = false;
    settings = {
      experimental-features = [
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
