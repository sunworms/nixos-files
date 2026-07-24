{pkgs, ...}: {
  packages = with pkgs; [
    matugen
    (writeShellScriptBin "apply-gtk4-theme" ''
      current=$(dconf read /org/gnome/desktop/interface/color-scheme)

      if [[ "$current" == "'prefer-dark'" ]]; then
          dconf write /org/gnome/desktop/interface/color-scheme "'prefer-light'"
          dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
      else
          dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
          dconf write /org/gnome/desktop/interface/color-scheme "'prefer-light'"
      fi
    '')
  ];

  xdg.config.files = {
    "matugen/config.toml".source = ./config.toml;
    "matugen/templates".source = ./templates;
  };
}
