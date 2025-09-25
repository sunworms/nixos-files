{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    (writeShellScriptBin "niri-color-picker" ''
    niri msg pick-color | awk '$1 == "Hex:" { printf "%s", $2 }' | wl-copy
    '')
  ];
}
