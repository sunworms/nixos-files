{ lib, pkgs, ... }:

{
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome = {
    enable = true;
    extraGSettingsOverrides = ''
      [org.gnome.desktop.interface]
      color-scheme='prefer-dark'
      gtk-theme='Adwaita-dark'

      [org.gnome.Console]
      custom-font='D2CodingLigature Nerd Font Mono 11'
      use-system-font=false

      [org.gnome.shell]
      favorite-apps=['org.gnome.Nautilus.desktop', 'org.gnome.Console.desktop', 'emacsclient.desktop', 'zen-beta.desktop']

      [org.gnome.desktop.background]
      picture-uri='file:///run/current-system/sw/share/backgrounds/gnome/progress-l.jxl'
picture-uri-dark='file:///run/current-system/sw/share/backgrounds/gnome/progress-d.jxl'

      [org.gnome.desktop.screensaver]
      picture-uri='file:///run/current-system/sw/share/backgrounds/gnome/progress-l.jxl'
    '';
    extraGSettingsOverridePackages = [
      pkgs.gnome-settings-daemon
      pkgs.gnome-console
    ];
  };

  services.gnome = {
    gnome-software.enable = lib.mkForce false;
    gnome-browser-connector.enable = false;
    gnome-user-share.enable = false;
    gnome-online-accounts.enable = false;
    gnome-keyring.enable = true; # true
    games.enable = false;
    core-developer-tools.enable = false;
    gnome-initial-setup.enable = false;
    tinysparql.enable = false;
    rygel.enable = false;
    localsearch.enable = false;
  };

  environment.gnome.excludePackages = with pkgs; [
    evolution-data-server
    epiphany
    gnome-contacts
    gnome-music
    gnome-tour
    gnome-maps
    gnome-weather
    gnome-calendar
    gnome-text-editor
    gnome-connections
    gnome-initial-setup
  ];

  programs.evince.enable = true;

  programs.seahorse.enable = true;

  # extensions
  environment.systemPackages = with pkgs.gnomeExtensions; [
    pip-on-top
    blur-my-shell
  ];
}
