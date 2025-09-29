{ config, lib, pkgs, ... }:

{
  packages = with pkgs; [
    (writeShellScriptBin "rofi-power-menu" (builtins.readFile ./rofi-power-menu))
    (writeShellScriptBin "cliphist-rofi-img" (builtins.readFile ./cliphist-rofi-img))
  ];
}
