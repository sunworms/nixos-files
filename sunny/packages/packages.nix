{ config, lib, pkgs, ... }:

{
  imports = [
    ./discord.nix
    ./blueman.nix
    ./hyfetch.nix
    ./spotify.nix
    ./helix.nix
  ];

  home.packages = with pkgs; [
    firefox
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
  ];

  systemd.user.services.waybar-toggle = {
    Unit = {
      Description = "Toggle waybar visibility with niri overview";
      After = [ "waybar.service" "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = pkgs.writeShellScript "niri-waybar-toggle" ''
        # Ignore SIGUSR1 so we don't get killed when toggling waybar
        trap "" USR1

        niri msg --json event-stream | while read -r event; do
            # Check if the event is an overview open/close event
            if echo "$event" | jq -e '.OverviewOpenedOrClosed' > /dev/null 2>&1; then
                # Get the overview state (true = open, false = closed)
                is_open=$(echo "$event" | jq -r '.OverviewOpenedOrClosed.is_open')
                
                if [ "$is_open" = "true" ]; then
                    # Overview opened - show waybar
                    pkill -USR1 waybar
                else
                    # Overview closed - hide waybar
                    pkill -USR1 waybar
                fi
            fi
        done
      '';
      Restart = "on-failure";
      RestartSec = 3;
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
