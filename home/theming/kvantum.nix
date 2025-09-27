{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qt6ct
    materia-kde-theme
  ];

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  xdg.configFile = {
    "Kvantum/MateriaDark".source = "${pkgs.materia-kde-theme}/share/Kvantum/MateriaDark";
    "Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=MateriaDark
    '';
  };
}
