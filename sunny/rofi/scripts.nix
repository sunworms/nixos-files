{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (writeShellScriptBin "rofi-power-menu-niri" (builtins.readFile ./rofi-power-menu-niri))
    (writeShellScriptBin "rofi-power-menu-mango" (builtins.readFile ./rofi-power-menu-mango))
  ];
}
