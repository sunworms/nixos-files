{
  pkgs,
  lib,
  config,
  ...
}: let
  iosevkaLean = pkgs.iosevka.override {
    set = "term-lean";
    privateBuildPlan = {
      family = "Iosevka Term Lean";
      spacing = "term";
      serifs = "sans";
      noCvSs = true;
      noLigation = true;
      exportGlyphNames = true;

      weights = {
        regular = {
          shape = 400;
          menu = 400;
          css = 400;
        };
        bold = {
          shape = 700;
          menu = 700;
          css = 700;
        };
      };

      slopes = {
        Upright = {
          angle = 0;
          shape = "upright";
          menu = "upright";
          css = "normal";
        };
        Italic = {
          angle = 9.4;
          shape = "italic";
          menu = "italic";
          css = "italic";
        };
      };

      widths = {
        normal = {
          shape = 500;
          menu = 5;
          css = "normal";
        };
      };
    };
  };

  iosevkaNerdLean = iosevkaLean.overrideAttrs (old: {
    nativeBuildInputs = (old.nativeBuildInputs or []) ++ [pkgs.nerd-font-patcher];

    postInstall =
      (old.postInstall or "")
      + ''
        mkdir -p $out/share/fonts/truetype/patched
        for f in $out/share/fonts/truetype/*.ttf; do
          nerd-font-patcher "$f" \
            --mono \
            --complete \
            --outputdir $out/share/fonts/truetype/patched
        done
        rm -rf $out/share/fonts/truetype/*.ttf
        mv $out/share/fonts/truetype/patched/* $out/share/fonts/truetype/
        rm -rf $out/share/fonts/truetype/patched
      '';
  });

  fontPackages = with pkgs; [
    iosevkaNerdLean
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
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
    sansSerif = "Noto Sans";
    serif = "Noto Serif";
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
