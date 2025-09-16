{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    (writeShellScriptBin "cliphist-fuzzel-img" (builtins.readFile ./cliphist-fuzzel-img))
  ];
}
