{pkgs, ...}: {
  packages = with pkgs; [
    fuzzel
    rofimoji
    (writeShellScriptBin "fuzzel-logout-menu" (builtins.readFile ./fuzzel-logout-menu))
    (writeShellScriptBin "niri-window-switcher" (builtins.readFile ./niri-window-switcher))
  ];

  xdg.config.files = {
    "fuzzel/fuzzel.ini".source = ./fuzzel.ini;
    "fuzzel/themes/mocha.ini".source = ./mocha-lavender.ini;
  };
}
