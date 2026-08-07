{
  pkgs,
  inputs,
  ...
}: {
  services = {
    upower.enable = true;
    watt = {
      enable = true;
      package = pkgs.callPackage "${inputs.watt}/nix/package.nix" {};
    };
  };
}
