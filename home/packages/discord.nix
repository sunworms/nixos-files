{ config, lib, pkgs, ... }:

{
  home.packages = [
    (pkgs.discord.override {
      withVencord = true;
    })
  ];
}
