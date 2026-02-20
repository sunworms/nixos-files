{ sources, ... }:

{
  xdg.config.files = {
    "DankMaterialShell/settings.json".source = ./dms.json;
    "DankMaterialShell/clsettings.json".source = ./dms-clipboard.json;
    "DankMaterialShell/plugin_settings.json".source = ./plugin_settings.json;
    "DankMaterialShell/themes/flexoki".source = "${sources.dms-plugin-registry.src}/themes/flexoki";
    "DankMaterialShell/themes/everforest".source =
      "${sources.dms-plugin-registry.src}/themes/everforest";
    "DankMaterialShell/themes/gruvbox-material".source =
      "${sources.dms-plugin-registry.src}/themes/gruvbox-material";
    "DankMaterialShell/plugins/niriWindows".source = "${sources.dms-niri-window.src}";
    "DankMaterialShell/plugins/emojiLauncher".source = "${sources.dms-emoji-launcher.src}";
  };
}
