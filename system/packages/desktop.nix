{ pkgs, ... }:

{
  services.displayManager = {
    sessionPackages = [
      pkgs.niri
    ];
    ly.enable = true;
  };

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };
}
