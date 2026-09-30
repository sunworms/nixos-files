{pkgs, ...}: {
  packages = with pkgs; [
    waybar
  ];

  xdg.config.files = {
    "waybar/config.jsonc".source = (pkgs.formats.json {}).generate "waybar.jsonc" (import ./config.nix);
    "waybar/style.css".source = ./style.css;
  };
}
