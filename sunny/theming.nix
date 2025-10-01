{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qt6ct
  ];

  gtk = {
    enable = true;
    colorScheme = "dark";
    theme = {
      name = "Materia-dark";
      package = pkgs.materia-theme;
    };
    cursorTheme = {
      name = "Vimix Cursors";
      size = 24;
      package = pkgs.vimix-cursors;
    };
    iconTheme = {
      name = "Tela-circle-black-dark";
      package = (pkgs.tela-circle-icon-theme.override {
        colorVariants = [ "black" ];
      });
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style = {
      name = "kvantum";
      package = pkgs.materia-kde-theme;
    };
  };
  xdg.configFile ={
    "Kvantum/MateriaDark".source = "${pkgs.materia-kde-theme}/share/Kvantum/MateriaDark";
    "Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=MateriaDark
    '';
  };
}
