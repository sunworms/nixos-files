{ secrets, pkgs, ... }:

{
  users.mutableUsers = false;

  users.users.root.hashedPassword = secrets.root.password;

  users.users.sunny = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    hashedPassword = secrets.sunny.password;
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  hjem.users.sunny = ../../users/sunny;
}
