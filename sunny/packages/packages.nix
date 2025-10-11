{ pkgs, ... }:

{
  imports = [
    ./discord.nix
    ./blueman.nix
    ./hyfetch.nix
    ./spotify.nix
    ./zed-editor.nix
    ./firefox.nix
  ];

  home.packages = with pkgs; [
    mate.atril
    pavucontrol

    wineWow64Packages.stable
    winetricks
    (callPackage ../derivations/pcsx2.nix { })
    ppsspp-sdl-wayland
    melonDS
    azahar
    mgba
    sameboy

    unrar
    p7zip

    nemo-with-extensions
    xdg-user-dirs

    jq
    (writeShellScriptBin "niri-color-picker" ''
      niri msg pick-color | awk '$1 == "Hex:" { printf "%s", $2 }' | wl-copy
    '')
  ];
}
