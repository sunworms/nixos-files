{lib, ...}: {
  options.fonts = {
    monospace = lib.mkOption {
      type = lib.types.str;
      default = "monospace";
      description = "Primary monospace font name across the system";
    };

    serif = lib.mkOption {
      type = lib.types.str;
      default = "serif";
      description = "Primary serif font name";
    };

    sansSerif = lib.mkOption {
      type = lib.types.str;
      default = "sans-serif";
      description = "Primary sans-serif font name";
    };

    emoji = lib.mkOption {
      type = lib.types.str;
      default = "emoji";
      description = "Primary emoji font name";
    };
  };
}
