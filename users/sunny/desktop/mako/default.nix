{ pkgs, ... }:

{
  packages = with pkgs; [
    mako
    libnotify
  ];

  xdg.config.files = {
    "mako/config".source = ./config;
  };
}
