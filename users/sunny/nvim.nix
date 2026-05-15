{ pkgs, inputs, ... }:

{
  packages = with pkgs; [
    inputs.sunny-nvim.packages.${pkgs.stdenv.hostPlatform.system}.default
    stylua
    lua-language-server
    ripgrep
    fd
    fzf
  ];
}
