{ config, lib, pkgs, ... }:

{
  imports = [
    ./cliphist-fuzzel-img.nix
  ];

  services.cliphist = {
    enable = true;
    allowImages = true;
  };
}
