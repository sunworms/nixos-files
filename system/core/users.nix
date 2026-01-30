{ config, pkgs, ... }:

{
  imports = [
    ../../users/sunny
  ];
  users.mutableUsers = false;

  users.users.root.hashedPasswordFile = config.sops.secrets.root_password.path;

  users.users.sunny = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    hashedPasswordFile = config.sops.secrets.sunny_password.path;
    shell = (import ../../users/sunny/wrappers/fish { inherit pkgs; });
  };

  programs.fish = {
    enable = true;
    package = config.users.users.sunny.shell;
  };
}
