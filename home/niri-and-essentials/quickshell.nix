{ pkgs, inputs, ... }:

{
  home.packages = [ inputs.quickshell.packages.x86_64-linux.default ];
}
