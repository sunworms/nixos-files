{
  pkgs,
  inputs,
  ...
}: let
  extensions = with inputs.vicinae-ext.packages.${pkgs.stdenv.hostPlatform.system}; [
    clean-keyboard
    helium
    kaomojis
    nerdfont-search
    niri
    nix
    process-manager
    screen-mirror
  ];
in {
  packages = with pkgs; [
    vicinae
    wl-mirror
    wlr-randr
  ];

  xdg.config.files."vicinae/settings.json".source = (pkgs.formats.json {}).generate "vicinae.json" {
    "$schema" = "https://vicinae.com/schemas/config.json";
    theme = {
      dark = {
        name = "pywal";
      };
      light = {
        name = "pywal";
      };
    };
    providers = {
      files = {
        preferences = {
          autoIndexing = false;
        };
      };
    };
  };

  xdg.data.files = builtins.listToAttrs (map (extension: {
      name = "vicinae/extensions/${extension.name}";
      value.source = extension;
    })
    extensions);
}
