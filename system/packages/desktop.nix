{ pkgs, inputs, ... }:

{
  programs.niri.enable = true;

  programs.dms-shell = {
    enable = true;
    systemd.enable = false;
    quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };
}
