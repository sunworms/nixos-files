{
  pkgs,
  lib,
  config,
  ...
}: let
  fontPackages = with pkgs; [
    literata
    source-han-serif
    recursive
    noto-fonts-color-emoji
    newcomputermodern
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
    sansSerif = "Recursive Sans Casual Static";
    serif = "Literata";
    monospace = "Recursive Mono Casual Static";
    emoji = "Noto Color Emoji";
  };

  xdg.data.files."fonts".source = combinedFonts;

  xdg.config.files."fontconfig/fonts.conf".text = import ./fonts.nix {inherit config;};

  systemd.services.refresh-font-cache = {
    description = "Refresh user fontconfig cache on home activation";

    after = ["basic.target"];

    restartTriggers = ["${pkgs.writeText "font-trigger" (toString combinedFonts)}"];

    wantedBy = ["default.target"];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${lib.getExe' pkgs.fontconfig "fc-cache"} -f";
    };
  };
}
