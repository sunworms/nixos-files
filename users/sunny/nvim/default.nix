{
  lib,
  pkgs,
  inputs,
  ...
}: let
  nvim = import ./package.nix {inherit pkgs inputs;};
in {
  packages = [
    nvim
    (pkgs.writeShellScriptBin "vi" ''
      exec ${lib.getExe nvim} "$@"
    '')
    (pkgs.writeShellScriptBin "vim" ''
      exec ${lib.getExe nvim} "$@"
    '')
  ];
}
