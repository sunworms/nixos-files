{ pkgs, inputs, ... }:

{
  packages = [
    inputs.neovim-config.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.lua-language-server
    pkgs.ripgrep
    pkgs.fd
  ];
}
