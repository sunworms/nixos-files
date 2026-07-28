{
  config,
  pkgs,
  lib,
  ...
}: {
  packages = with pkgs; [
    kitty
    (runCommand "xdg-terminal-exec" {} ''
      mkdir -p $out/bin
      ln -sf ${kitty}/bin/kitty $out/bin/xdg-terminal-exec
    '')
  ];

  xdg.config.files."kitty/kitty.conf".source = pkgs.writeText "kitty.conf" (
    lib.generators.toKeyValue {
      mkKeyValue = key: value: let
        formattedValue =
          if builtins.isBool value
          then
            (
              if value
              then "yes"
              else "no"
            )
          else toString value;
      in "${key} ${formattedValue}";
    } (import ./kitty.nix {inherit config;})
  );
}
