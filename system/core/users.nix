{ config, pkgs, ... }:

let
  keys = import ./keys.nix;
in
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
    openssh.authorizedKeys.keys = [
      keys.sunny.aur
      keys.sunny.gitgay
      keys.sunny.github
    ];
  };

  programs.fish.enable = true;

  services.accounts-daemon.enable = true;

  hjem.users.sunny = ../../users/sunny;
}
