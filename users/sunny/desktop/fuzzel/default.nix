{pkgs, ...}: {
  packages = with pkgs; [
    fuzzel
    cliphist
    rofimoji
    (writeShellScriptBin "fuzzel-logout-menu" (builtins.readFile ./fuzzel-logout-menu))
    (writeShellScriptBin "niri-window-switcher" (builtins.readFile ./niri-window-switcher))
  ];

  xdg.config.files."fuzzel/fuzzel.ini".source = ./fuzzel.ini;
}
