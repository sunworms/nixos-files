{ pkgs, ... }:

{
  home.packages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qt6ct
  ];

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = (
        pkgs.papirus-icon-theme.override {
          color = "green";
        }
      );
    };
  };
}
