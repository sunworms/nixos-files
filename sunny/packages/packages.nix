{ config, lib, pkgs, ... }:

{
  imports = [
    ./discord.nix
    ./blueman.nix
    ./hyfetch.nix
    ./helix.nix
  ];

  home.packages = with pkgs; [
    firefox
    youtube-music
    mate.atril

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
    (writeShellScriptBin "waybar-toggle" ''
      trap "" USR1
   
      ${pkgs.niri}/bin/niri msg --json event-stream | while read -r event; do
          # Check if the event is an overview open/close event
          if echo "$event" | ${pkgs.jq}/bin/jq -e '.OverviewOpenedOrClosed' > /dev/null 2>&1; then
              # Get the overview state (true = open, false = closed)
              is_open=$(echo "$event" | ${pkgs.jq}/bin/jq -r '.OverviewOpenedOrClosed.is_open')
              
              if [ "$is_open" = "true" ]; then
                  # Overview opened - show waybar
                  ${pkgs.procps}/bin/pkill -USR1 waybar
              else
                  # Overview closed - hide waybar
                  ${pkgs.procps}/bin/pkill -USR1 waybar
              fi
          fi
      done
    '')
  ];
}
