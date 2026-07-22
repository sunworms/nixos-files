{pkgs, ...}: {
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./desktop.nix
    ./portals.nix
    ./programs.nix
    ./flatpaks.nix
  ];

  services.gvfs = {
    enable = true;
    package = pkgs.gvfs;
  };

  programs.gamescope.enable = true;

  services.udev.extraRules = ''
    KERNEL=="uinput", SUBSYSTEM=="misc", TAG+="uaccess", OPTIONS+="static_node=uinput"
  '';
}
