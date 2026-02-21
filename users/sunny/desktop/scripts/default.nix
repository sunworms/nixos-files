{ pkgs, ... }:

{
  packages = with pkgs; [
    (writeShellScriptBin "volume-notif" (builtins.readFile ./volume-notif.sh))
    (writeShellScriptBin "bright-notif" (builtins.readFile ./bright-notif.sh))
    (writeShellScriptBin "fuzzel-menu" (builtins.readFile ./fuzzel-menu.sh))
  ];
}
