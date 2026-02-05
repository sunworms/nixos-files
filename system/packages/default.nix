{ pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./desktop.nix
    ./fonts.nix
    ./portals.nix
    ./programs.nix
  ];

  services.gvfs = {
    enable = true;
    package = pkgs.gvfs;
  };

  programs.gamescope.enable = true;
}
