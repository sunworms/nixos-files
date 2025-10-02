{ config, lib, pkgs, ... }:

{
  nix = {
    channel.enable = false;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "sunny" ];
    };
  };
}
