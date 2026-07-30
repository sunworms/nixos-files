{
  pkgs,
  inputs,
  ...
}: let
  launcherDeps = pkgs.buildEnv {
    name = "termfilechooser-deps";
    paths = with pkgs; [
      coreutils
      gnused
      bashInteractive
      (import ./yazi {inherit pkgs;})
    ];
  };
in {
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
    inputs.neovim-config.packages.${pkgs.stdenv.hostPlatform.system}.default
    imv
    (import ./yazi {inherit pkgs;})
    ripdrag
    ripgrep
    fzf
    kanata
  ];

  xdg.config.files = {
    "kanata/config.kbd".source = ./kanata.kbd;
    "xdg-desktop-portal/niri-portals.conf".text = ''
      [preferred]
      default=gnome;gtk
      org.freedesktop.impl.portal.FileChooser=termfilechooser
    '';

    "xdg-desktop-portal-termfilechooser/config".text = ''
      [filechooser]
      env=PATH='${launcherDeps}/bin'
      env=TERMCMD='${pkgs.kitty}/bin/kitty --class=xdg_filechooser'
      cmd='${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh'
      default_dir=$HOME
    '';
  };
}
