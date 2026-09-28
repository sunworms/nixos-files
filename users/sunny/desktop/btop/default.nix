{pkgs, ...}: {
  packages = with pkgs; [
    btop
  ];

  xdg.config.files."btop/btop.conf".text = ''
    color_theme = "mocha"
  '';

  xdg.config.files."btop/themes/mocha.theme".source = ./catppuccin_mocha.theme;
}
