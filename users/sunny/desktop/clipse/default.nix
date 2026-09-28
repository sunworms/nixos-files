{pkgs, ...}: {
  packages = with pkgs; [clipse];

  xdg.config.files = {
    "clipse/custom_theme.json".source = ./catppuccin-mocha-lavender.json;
    "clipse/config.json".source = (pkgs.formats.json {}).generate "clipse.json" {
      keyBindings = {
        quit = "q,esc";
      };
      imageDisplay = {
        type = "kitty";
      };
    };
  };
}
