{ pkgs, inputs, ... }:

{
  services = {
    upower.enable = true;
    power-profiles-daemon.enable = false;
    watt = {
      enable = true;
      package = inputs.watt.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };
  };
}
