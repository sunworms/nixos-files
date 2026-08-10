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
    (import inputs.neovim-config.src {inherit pkgs;})
    imv
    yaziUnfree
    ripdrag
    ripgrep
    fzf
    bat
    wayfreeze
    kanata
    fuzzel
  ];

  xdg.config.files = {
    "kanata/config.kbd".source = ./kanata.kbd;

    "fuzzel/fuzzel.ini".text = ''
      include=~/.config/fuzzel/themes/noctalia
    '';

    "xdg-desktop-portal/mango-portals.conf".text = ''
      [preferred]
      default=gtk
      org.freedesktop.impl.portal.Inhibit=gtk
      org.freedesktop.impl.portal.FileChooser=termfilechooser
      org.freedesktop.impl.portal.ScreenCast=wlr
      org.freedesktop.impl.portal.ScreenShot=wlr
      org.freedesktop.impl.portal.Secret=gnome-keyring
    '';

    "xdg-desktop-portal-wlr/config".text = ''
      [screencast]
      chooser_type = dmenu
      chooser_cmd = fuzzel -d
      max_fps = 60
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
