{
  lib,
  pkgs,
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
    ./helix
    ./packages
    ./fonts
    ./desktop
    ./ssh.nix
    ./theming.nix
  ];

  directory = "/home/sunny";

  packages = with pkgs; [
    yaziUnfree
    (writeShellScriptBin "ls" ''
      exec ${lib.getExe pkgs.lsd} "$@"
    '')
    lsd
    lazygit
    imv
    ripdrag
    ripgrep
    fzf
    bat
    kanata
    wl-clip-persist
  ];

  xdg.config.files = {
    "kanata/config.kbd".source = ./kanata.kbd;

    "xdg-desktop-portal/umbriel-portals.conf".text = ''
      [preferred]
      default=umbriel;gtk;
      org.freedesktop.impl.portal.FileChooser=termfilechooser;
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
