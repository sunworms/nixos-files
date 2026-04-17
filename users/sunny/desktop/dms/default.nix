{ pkgs, inputs, ... }:

{
  packages = [
    inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.matugen
    pkgs.dgop
    pkgs.cava
    pkgs.wl-mirror
  ];

  xdg.config.files = {
    "DankMaterialShell/clsettings.json".source = ./clsettings.json;
    "DankMaterialShell/settings.json".source = ./settings.json;
    "DankMaterialShell/plugin_settings.json".source = ./plugin_settings.json;

    # plugins
    "DankMaterialShell/plugins/emojiLauncher".source =
      inputs.dms-plugin-registry.packages.${pkgs.stdenv.hostPlatform.system}.emojiLauncher;
    "DankMaterialShell/plugins/niriWindows".source =
      inputs.dms-plugin-registry.packages.${pkgs.stdenv.hostPlatform.system}.niriWindows;
    "DankMaterialShell/plugins/displayMirror".source =
      inputs.dms-plugin-registry.packages.${pkgs.stdenv.hostPlatform.system}.displayMirror;

    "matugen".source = ./matugen;
  };
}
