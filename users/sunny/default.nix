{
  pkgs,
  lib,
  inputs,
  ...
}: let
  yaziUnfree = pkgs.yazi.override {
    _7zz = pkgs._7zz-rar;
  };

  launcherDeps = pkgs.buildEnv {
    name = "termfilechooser-deps";
    paths = with pkgs; [
      coreutils
      gnused
      bashInteractive
      yaziUnfree
    ];
  };
in {
  imports = [
    ./yazi
    ./packages
    ./fonts
    ./desktop
    ./ssh.nix
    ./theming.nix
    ./browser.nix
  ];

  directory = "/home/sunny";

  packages = with pkgs; [
    (import "${inputs.neovim-config}/package.nix" {inherit pkgs;})
    imv
    yaziUnfree
    ripdrag
    ripgrep
    fzf
    bat
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
      env=TERMCMD='${lib.getExe pkgs.foot} --app-id=xdg_filechooser'
      cmd='${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh'
      default_dir=$HOME
    '';
  };
}
