{ config, pkgs, ... }:

{
  users.mutableUsers = false;

  services.userborn.enable = true;

  users.users.root.hashedPasswordFile = config.sops.secrets.root_password.path;

  users.users.sunny = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    hashedPasswordFile = config.sops.secrets.sunny_password.path;
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  hjem.users.sunny = ../../users/sunny;
}
