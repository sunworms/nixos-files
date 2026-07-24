{pkgs, ...}: {
  packages = with pkgs; [
    waybar
    networkmanagerapplet
  ];

  xdg.config.files = {
    "waybar/config.jsonc".source = ./config.jsonc;
    "waybar/style.css".source = ./style.css;
  };
}
