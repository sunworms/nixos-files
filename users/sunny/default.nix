{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./packages
    ./fonts
    ./desktop
    ./ssh.nix
    ./theming.nix
    ./browser.nix
  ];

  directory = "/home/sunny";

  packages = with pkgs; [
    (import inputs.neovim-config.src {inherit pkgs;})
    swayimg
    ripgrep
    fzf
    bat
    lsd
    kanata
    wl-clip-persist
  ];

  xdg.config.files = {
    "kanata/config.kbd".source = ./kanata.kbd;

    "xdg-desktop-portal/umbriel-portals.conf".text = ''
      [preferred]
      default=umbriel;gtk
      org.freedesktop.impl.portal.FileChooser=gnome;
    '';
  };
}
