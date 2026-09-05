{
  lib,
  pkgs,
  ...
}: {
  xdg.config.files."umbriel/config.toml".source = (pkgs.formats.toml {}).generate "umbriel.toml" (import ./config {inherit lib;});

  packages = with pkgs; [
    grim
    slurp
    wayfreeze
    libnotify
    (writeShellScriptBin "umbriel-screenshot" (builtins.readFile ./screenshot.sh))
  ];
}
