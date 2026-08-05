{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./desktop.nix
    ./portals.nix
    ./programs.nix
  ];

  services.gvfs = {
    enable = true;
    package = pkgs.gvfs;
  };

  fonts.packages = lib.mkForce [];

  programs.gamescope.enable = true;

  programs.nano.enable = false;

  hardware.uinput.enable = true;

  services.udev.extraRules = ''
    KERNEL=="uinput", SUBSYSTEM=="misc", TAG+="uaccess", OPTIONS+="static_node=uinput"
  '';
}
