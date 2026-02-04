{ pkgs, lib, ... }:

{
  imports = [
    ./packages
    ./desktop
    ./browser.nix
  ];

  directory = "/home/sunny";

  packages = with pkgs; [
    # fish plugins
    fishPlugins.tide
    fishPlugins.git-abbr

    # for google drive
    rclone

    # theming
    adw-gtk3
    volantes-cursors
    candy-icons
    (writeShellScriptBin "apply-gtk-settings" ''
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/gtk-theme "'adw-gtk3'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/icon-theme "'candy-icons'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/cursor-theme "'volantes_cursors'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/cursor-size 24
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
    '')

    #image viewer
    swayimg
  ];

  systemd.services.rclone-gdrive-org = {
    description = "Rclone Google Drive Org Mount";
    wantedBy = [ "default.target" ];
    after = [ "network-online.target" ];
    environment = {
      PATH = lib.mkForce "/run/wrappers/bin:/etc/profiles/per-user/sunny/bin:/run/current-system/sw/bin";
    };
    serviceConfig = {
      Type = "simple";
      ExecStartPre = [
        "${pkgs.coreutils}/bin/mkdir -p %h/Documents/org"
      ];
      ExecStart = ''
        ${pkgs.rclone}/bin/rclone mount gdrive:org %h/Documents/org --vfs-cache-mode writes
      '';
      ExecStop = "/run/wrappers/bin/fusermount3 -u %h/Documents/org";
      Restart = "always";
      RestartSec = 5;
      KillMode = "process";
    };
  };
}
