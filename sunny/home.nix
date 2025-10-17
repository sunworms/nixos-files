{ ... }:

{
  imports = [
    ./sops.nix
    ./git.nix
    ./rofi/rofi.nix
    # ./niri/niri.nix
    ./mangowc/mangowc.nix
    ./packages/packages.nix
    ./theming.nix
    ./desktop-files.nix
    ./shell.nix
  ];

  home.username = "sunny";
  home.homeDirectory = "/home/sunny";

  home.stateVersion = "25.11";
}
