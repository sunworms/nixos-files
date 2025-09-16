{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qt6ct
  ];

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style = {
      name = "kvantum";
      package = pkgs.catppuccin-kvantum.override {
        variant = "mocha";
        accent = "lavender";
      };
    };
  };
}
