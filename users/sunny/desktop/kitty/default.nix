{
  pkgs,
  lib,
  config,
  ...
}: let
  toKittyConfig = attrs: let
    formatValue = v:
      if builtins.isBool v
      then
        (
          if v
          then "yes"
          else "no"
        )
      else if builtins.isList v
      then lib.concatMapStringsSep " " formatValue v
      else toString v;

    formatEntry = key: value:
      if builtins.isList value
      then lib.concatMapStringsSep "\n" (item: "${key} ${formatValue item}") value
      else "${key} ${formatValue value}";
  in
    lib.concatStringsSep "\n" (lib.mapAttrsToList formatEntry attrs) + "\n";
in {
  packages = with pkgs; [
    kitty
    (runCommand "xdg-terminal-exec" {} ''
      mkdir -p $out/bin
      ln -sf ${lib.getExe kitty} $out/bin/xdg-terminal-exec
    '')
  ];

  xdg.config.files."kitty/kitty.conf".text = toKittyConfig (import ./kitty.nix {inherit config;});
}
