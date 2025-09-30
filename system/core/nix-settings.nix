{ config, lib, pkgs, ... }:

{
  nix = {
    channel.enable = false;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "sunny" ];
      substituters = [ "https://niri.cachix.org" ];
      trusted-substituters = [ "https://niri.cachix.org" "https://cache.nixos.org" ];
      trusted-public-keys = [ "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964=" ];
    };
  };
}
