{ config, pkgs, ... }:

{
  users.mutableUsers = false;

  users.users.root.hashedPasswordFile = config.sops.secrets.root_password.path;

  users.users.sunny = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "fuse"
    ];
    hashedPasswordFile = config.sops.secrets.sunny_password.path;
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  hjem.users.sunny = ../../users/sunny;
}
