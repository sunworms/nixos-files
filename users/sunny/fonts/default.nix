{
  pkgs,
  lib,
  config,
  ...
}: let
  fontPackages = with pkgs; [
    nerd-fonts.d2coding
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
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
    sansSerif = "Noto Sans";
    serif = "Noto Serif";
    monospace = "D2KodingLigature Nerd Font Mono";
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
