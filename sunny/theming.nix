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
      name = "Tela-circle-black-dark";
      package = (
        pkgs.tela-circle-icon-theme.override {
          colorVariants = [ "black" ];
        }
      );
    };
  };
}
