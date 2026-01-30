{ pkgs, ... }:

{
  nix = {
    package = pkgs.nixVersions.git;
    channel.enable = false;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [ "sunny" ];
    };
  };
  
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [];
  };
}
