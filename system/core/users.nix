{ config, pkgs, ... }:

{
  users.mutableUsers = false;

  users.users.root.hashedPasswordFile = config.sops.secrets."root/password".path;

  users.users.sunny = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    hashedPasswordFile = config.sops.secrets."sunny/password".path;
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  hjem.users.sunny = ../../users/sunny;
}
