{ pkgs, ... }:

{
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  programs.mango.enable = true;
}
