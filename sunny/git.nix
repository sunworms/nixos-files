{ config, ... }:

let
  githubToken = builtins.readFile config.sops.secrets."sunny/github/token".path;
in
{
  programs.git = {
    enable = true;
    userEmail = "sunnybhowmick0310@gmail.com";
    userName = "Sunny";
    extraConfig = {
      url = {
        "https://oauth2:${githubToken}@github.com" = {
          insteadOf = "https://github.com";
        };
      };
    };
  };
}
