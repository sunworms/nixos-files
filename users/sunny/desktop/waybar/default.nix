{pkgs, ...}: {
  packages = with pkgs; [
    waybar
    networkmanagerapplet
    wirelesstools
    iw
    (writeShellScriptBin "network-script" (builtins.readFile ./network-script))
  ];

  xdg.config.files = {
    "waybar/config-1.jsonc".source = ./config-1.jsonc;
    "waybar/config-2.jsonc".source = ./config-2.jsonc;
    "waybar/style.css".source = ./style.css;
  };
}
