{ config, pkgs, ... }:

{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-hard.yaml";
    image = ../../assets/walls/raindrops.jpg;
    polarity = "dark";
    cursor = {
      name = "everforest-cursors";
      package = (pkgs.callPackage ../derivations/everforest-cursors.nix { });
      size = 24;
    };
    icons = {
      enable = true;
      dark = "Tela circle black dark";
      package = (
        pkgs.tela-circle-icon-theme.override {
          colorVariants = [ "black" ];
        }
      );
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.d2coding;
        name = "D2CodingLigature Nerd Font Mono";
      };
      serif = {
        package = pkgs.nerd-fonts.d2coding;
        name = "D2CodingLigature Nerd Font Propo";
      };
      sansSerif = config.stylix.fonts.serif;
      sizes = {
        applications = 12;
        desktop = 11;
        terminal = 11;
      };
    };
  };
}
