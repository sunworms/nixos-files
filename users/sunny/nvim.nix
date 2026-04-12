{ pkgs, inputs, ... }:

{
  packages = [
    inputs.sunny-nvim.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.stylua
    pkgs.lua-language-server
    pkgs.ripgrep
    pkgs.fd
  ];
}
