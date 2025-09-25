{ config, lib, pkgs, inputs, ... }:

{
  nix = {
    channel.enable = false;
    registry = (lib.mapAttrs (_: flake: { inherit flake; }) inputs);
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") inputs;
    settings = {
        nix-path = lib.mapAttrsToList (n: _: "${n}=flake:${n}") inputs;
        flake-registry = ""; # optional, ensures flakes are truly self-contained
    };

    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "sunny" ];
    };
  };
}
