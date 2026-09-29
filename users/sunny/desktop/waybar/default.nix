{pkgs, ...}: {
  packages = with pkgs; [
    waybar
  ];

  xdg.config.files = {
    "waybar/config.jsonc".source = ./config.jsonc;
    "waybar/style.css".source = ./style.css;
  };
}
