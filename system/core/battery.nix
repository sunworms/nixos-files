{
  pkgs,
  inputs,
  ...
}: {
  services = {
    upower.enable = true;
    power-profiles-daemon.enable = false;
    watt = {
      enable = true;
      package = pkgs.callPackage "${inputs.watt}/nix/package.nix" {};
    };
  };
}
