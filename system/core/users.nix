{
  pkgs,
  config,
  ...
}: let
  keys = import ./keys.nix;
in {
  users.mutableUsers = false;

  users.users.root.hashedPasswordFile = config.age.secrets.root-password.path;

  users.users.sunny = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "input"
      "uinput"
      "video"
      "render"
      "accel"
    ];
    hashedPasswordFile = config.age.secrets.sunny-password.path;
    openssh.authorizedKeys.keys = [
      keys.sunny.aur
      keys.sunny.gitgay
      keys.sunny.github
    ];
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
  };

  environment.systemPackages = [pkgs.fish];
  environment.shells = [pkgs.fish];

  hjem.users.sunny = ../../users/sunny;
}
