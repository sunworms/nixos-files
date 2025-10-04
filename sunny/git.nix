{ config, lib, pkgs, ... }:

let
  secrets = builtins.fromJSON (builtins.readFile "/home/sunny/Documents/nixos-files/secrets/sunny.json");
in
{
  programs.git = {
    enable = true;
    userEmail = "sunnybhowmick0310@gmail.com";
    userName = "Sunny";
    extraConfig = {
      url = {
        "https://oauth2:${secrets.github.oauth_token}@github.com" = {
          insteadOf = "https://github.com";
        };
      };
    };
  };
}
