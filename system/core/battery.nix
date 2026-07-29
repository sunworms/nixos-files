{
  pkgs,
  inputs,
  ...
}: {
  services = {
    upower.enable = true;
    watt = {
      enable = true;
      package = inputs.watt.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };
  };
}
