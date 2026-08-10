{
  lib,
  pkgs,
  ...
}: let
  mangoConfig = import ./config {inherit lib;};

  toMangoConfig = attrs: let
    toStr = v:
      if builtins.isBool v
      then
        (
          if v
          then "1"
          else "0"
        )
      else toString v;

    mkLine = k: v:
      if builtins.isList v
      then builtins.concatStringsSep "\n" (map (x: "${k}=${toStr x}") v)
      else "${k}=${toStr v}";
  in
    builtins.concatStringsSep "\n" (lib.mapAttrsToList mkLine attrs);
in {
  xdg.config.files = {
    "mango/config.conf".text = toMangoConfig mangoConfig;
  };

  packages = with pkgs; [
    (writeShellScriptBin "mango-screenshot" (builtins.readFile ./scripts/screenshot.sh))
  ];
}
