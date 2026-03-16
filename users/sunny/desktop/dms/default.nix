{ pkgs, sources, ... }:

{
  xdg.state.files."DankMaterialShell/session.json".source =
    (pkgs.formats.json { }).generate "session.json"
      (import ./session.nix { inherit sources; });

  xdg.config.files = {
    "DankMaterialShell/settings.json".source = (pkgs.formats.json { }).generate "settings.json" (
      import ./settings.nix
    );
    "DankMaterialShell/clsettings.json".source = (pkgs.formats.json { }).generate "clsettings.json" (
      import ./clsettings.nix
    );
    "DankMaterialShell/plugin_settings.json".source =
      (pkgs.formats.json { }).generate "plugin_settings.json"
        (import ./plugin_settings.nix);
  };
}
