{
  pkgs,
  lib,
  config,
  sources,
  ...
}: let
  fontPackages = with pkgs; [
    (callPackage ./iosevka.nix {inherit sources;})
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
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
    sansSerif = "Iosevka Aile Lean";
    serif = "Iosevka Etoile Lean";
    monospace = "IosevkaTermLean Nerd Font Mono";
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
