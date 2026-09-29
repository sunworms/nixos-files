{pkgs, ...}: {
  packages = with pkgs; [clipse];

  xdg.config.files = {
    "clipse/config.json".source = (pkgs.formats.json {}).generate "clipse.json" {
      themeFile = "~/.cache/wal/clipse.json";
      keyBindings = {
        quit = "q,esc";
      };
      imageDisplay = {
        type = "sixel";
      };
    };
  };
}
