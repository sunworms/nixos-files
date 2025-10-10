{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (writeShellScriptBin "rofi-power-menu" (builtins.readFile ./rofi-power-menu))
  ];
}
