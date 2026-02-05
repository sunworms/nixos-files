{ pkgs, sources, ... }:

{
  programs.regreet = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };
  
  programs.niri.enable = true;

  programs.dms-shell = {
    enable = true;
    systemd.enable = false;
    quickshell.package = (pkgs.callPackage "${sources.quickshell.src}/default.nix" {});
  };

  services.desktopManager.budgie.enable = true;

  environment.budgie.excludePackages = [ pkgs.vlc ];
}
