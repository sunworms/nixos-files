{
  pkgs,
  lib,
  config,
  ...
}: let
  fontPackages = with pkgs; [
    nerd-fonts.ubuntu-mono
    ubuntu-sans
    merriweather
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
    noto-fonts
  ];

  combinedFonts = pkgs.symlinkJoin {
    name = "combined-fonts";
    paths = map (pkg: "${pkg}/share/fonts") fontPackages;
  };
in {
  imports = [
    ./options.nix
  ];

  fonts = {
    sansSerif = "Ubuntu Sans";
    serif = "Merriweather";
    monospace = "UbuntuMono Nerd Font Mono";
    emoji = "Noto Color Emoji";
  };

  xdg.data.files."fonts".source = combinedFonts;

  xdg.config.files."fontconfig/fonts.conf".text = import ./fonts.nix {inherit config;};

  systemd.services.refresh-font-cache = {
    description = "Refresh user fontconfig cache on home activation";

    after = ["basic.target"];

    restartTriggers = ["${pkgs.writeText "font-trigger" (toString combinedFonts)}"];

    environment = {
      PATH = lib.mkForce null;
    };

    wantedBy = ["default.target"];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "/usr/bin/env fc-cache -f";
    };
  };
}
