{pkgs}:
pkgs.iosevka.override {
  set = "aile-lean";
  privateBuildPlan = {
    family = "Iosevka Aile Lean";
    spacing = "quasi-proportional";
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
}
