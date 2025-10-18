{ config, pkgs, ... }:

let
  nixos = ../../assets/icons/NixOS.png;
  waybarConfigDir = "${config.home.homeDirectory}/.config/waybar";
in
{
  stylix.targets.waybar.enable = false;

  services.playerctld.enable = true;

  programs.waybar = {
    enable = true;
  };

  systemd.user.services.waybar = {
    Unit = {
      Description = "Waybar status bar";
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = pkgs.writeShellScript "waybar-launch" ''
        export PATH="/etc/profiles/per-user/sunny/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin:$PATH"
        export GTK_ICON_THEME=Papirus-Dark
        export XCURSOR_THEME=everforest-cursors
        export XCURSOR_SIZE=24
        compositor="''${XDG_CURRENT_DESKTOP:-unknown}"

        case "''$compositor" in
          niri)
            cfg="${waybarConfigDir}/config-niri"
            ;;
          mango)
            cfg="${waybarConfigDir}/config-mango"
            ;;
          *)
            cfg="${waybarConfigDir}/config"
            ;;
        esac

        style="${waybarConfigDir}/style.css"

        echo "Launching Waybar for compositor: ''$compositor"
        exec ${pkgs.waybar}/bin/waybar --config "''$cfg" --style "''$style"
      '';

      Restart = "on-failure";
      RestartSec = 2;
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  xdg.configFile."waybar/config-mango".text = ''
    [
    {
      "backlight": {
        "device": "intel_backlight",
        "format": "{icon}",
        "format-icons": [
          "󰛩",
          "󱩎",
          "󱩏",
          "󱩐",
          "󱩑",
          "󱩒",
          "󱩓",
          "󱩔",
          "󱩕",
          "󱩖",
          "󰛨"
        ],
        "on-scroll-down": "${pkgs.brightnessctl}bin/brightnessctl set 1%-",
        "on-scroll-up": "${pkgs.brightnessctl}/bin/brightnessctl set +1%",
        "tooltip-format": "{percent}%"
      },
      "battery": {
        "events": {
          "on-charging-100": "${pkgs.libnotify}/bin/notify-send -u normal 'Battery Full!'",
          "on-discharging-critical": "${pkgs.libnotify}/bin/notify-send -u critical 'Very Low Battery'",
          "on-discharging-warning": "${pkgs.libnotify}/bin/notify-send -u normal 'Low Battery'"
        },
        "format": "{icon}",
        "format-icons": [
          "󰂎",
          "󰁺",
          "󰁻",
          "󰁼",
          "󰁽",
          "󰁾",
          "󰁿",
          "󰂀",
          "󰂁",
          "󰂂",
          "󰁹"
        ],
        "interval": 5,
        "states": {
          "critical": 15,
          "warning": 30
        },
        "tooltip-format": "{capacity}% {timeTo}"
      },
      "cava": {
        "autosens": 1,
        "bar_delimiter": 0,
        "bars": 15,
        "format-icons": [
          "▁ ",
          "▂ ",
          "▃ ",
          "▄ ",
          "▅ ",
          "▆ ",
          "▇ ",
          "█ "
        ],
        "framerate": 60,
        "higher_cutoff_freq": 10000,
        "input_delay": 1,
        "lower_cutoff_freq": 50,
        "method": "pipewire",
        "monstercat": false,
        "noise_reduction": 0.77,
        "reverse": false,
        "sleep_timer": 5,
        "source": "auto",
        "stereo": true,
        "waves": false
      },
      "clock": {
        "calendar": {
          "format": {
            "days": "<span color='#ecc6d9'><b>{}</b></span>",
            "months": "<span color='#ffead3'><b>{}</b></span>",
            "today": "<span color='#ff6699'><b><u>{}</u></b></span>",
            "weekdays": "<span color='#ffcc66'><b>{}</b></span>",
            "weeks": "<span color='#99ffdd'><b>W{}</b></span>"
          },
          "mode": "year",
          "mode-mon-col": 3,
          "on-click-right": "mode",
          "on-scroll": 1,
          "weeks-pos": "right"
        },
        "format": "{:%a, %b %d %Y - %H:%M}",
        "tooltip-format": "<tt><small>{calendar}</small></tt>"
      },
      "cpu": {
        "format": "{icon}",
        "format-icons": [
          ""
        ],
        "interval": 2,
        "states": {
          "critical": 90
        }
      },
      "custom/arrow-left": {
        "format": "  ",
        "tooltip": false
      },
      "ext/workspaces": {
        "all-outputs": true,
        "disable-scroll": true,
        "format": "{icon}",
        "format-icons": {
          "1": "1",
          "10": "10",
          "2": "2",
          "3": "3",
          "4": "4",
          "5": "5",
          "6": "6",
          "7": "7",
          "8": "8",
          "9": "9"
        },
        "tooltip": false
      },
      "group/info": {
        "drawer": {
          "transition-duration": 300,
          "transition-left-to-right": true
        },
        "modules": [
          "custom/arrow-left",
          "idle_inhibitor",
          "cpu",
          "memory",
          "temperature",
          "battery",
          "network",
          "backlight",
          "wireplumber#sink",
          "wireplumber#source"
        ],
        "orientation": "inherit"
      },
      "height": 0,
      "idle_inhibitor": {
        "format": "{icon}",
        "format-icons": {
          "activated": "",
          "deactivated": ""
        }
      },
      "image": {
        "on-click": "exec rofi -show drun -location 7",
        "on-click-right": "exec rofi -show power-menu -modi power-menu:rofi-power-menu-mango -location 7",
        "path": "${nixos}",
        "size": 14
      },
      "layer": "top",
      "memory": {
        "format": "{icon}",
        "format-icons": [
          ""
        ],
        "interval": 2,
        "states": {
          "critical": 80
        }
      },
      "modules-center": [
        "mpris"
      ],
      "modules-left": [
        "image",
        "ext/workspaces",
        "wlr/taskbar",
        "cava"
      ],
      "modules-right": [
        "group/info",
        "tray",
        "clock"
      ],
      "mpris": {
     	  "format": "{player_icon} {dynamic}",
       	"format-paused": "{status_icon} <i>{dynamic}</i>",
        "max-length": 30,
       	"player-icons": {
      		"default": "▶"
       	},
       	"status-icons": {
      		"paused": "⏸"
       	},
      },
      "network": {
        "format-disconnected": "󰖪",
        "format-ethernet": "󰈀",
        "format-wifi": "󰖩",
        "interval": 5,
        "on-click": "foot nmtui",
        "tooltip-format": "{ifname} {bandwidthDownBytes}",
        "tooltip-format-disconnected": "Disconnected",
        "tooltip-format-ethernet": "{ifname} {bandwidthDownBytes} 󰈀",
        "tooltip-format-wifi": "{essid} {bandwidthDownBytes} "
      },
      "position": "bottom",
      "spacing": 0,
      "temperature": {
        "critical-threshold": 90,
        "format": "{icon}",
        "format-icons": [
          "",
          "",
          "",
          "",
          ""
        ],
        "interval": 5,
        "warning-threshold": 75
      },
      "tray": {
        "icon-size": 13,
        "spacing": 10,
        "tooltip": false
      },
      "wireplumber#sink": {
        "format": "{icon}",
        "format-icons": [
          "󰕿",
          "󰖀",
          "󰕾"
        ],
        "format-muted": "󰝟",
        "max-volume": 200,
        "on-click": "pavucontrol",
        "on-click-right": "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
        "scroll-step": 1,
        "tooltip-format": "{volume}%"
      },
      "wireplumber#source": {
        "format": "",
        "format-muted": "",
        "max-volume": 200,
        "node-type": "Audio/Source",
        "on-click": "pavucontrol",
        "on-click-right": "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle",
        "scroll-step": 1,
        "tooltip-format": "{volume}%"
      },
      "wlr/taskbar": {
        "format": "{icon}",
        "icon-size": 14,
        "icon-theme": "Tela-circle-dracula-dark",
        "on-click": "activate",
        "on-click-right": "close",
        "tooltip-format": "{title}"
      }
    }
    ]
  '';

  xdg.configFile."waybar/config-niri".text = ''
    [
    {
      "backlight": {
        "device": "intel_backlight",
        "format": "{icon}",
        "format-icons": [
          "󰛩",
          "󱩎",
          "󱩏",
          "󱩐",
          "󱩑",
          "󱩒",
          "󱩓",
          "󱩔",
          "󱩕",
          "󱩖",
          "󰛨"
        ],
        "on-scroll-down": "${pkgs.brightnessctl}bin/brightnessctl set 1%-",
        "on-scroll-up": "${pkgs.brightnessctl}/bin/brightnessctl set +1%",
        "tooltip-format": "{percent}%"
      },
      "battery": {
        "events": {
          "on-charging-100": "${pkgs.libnotify}/bin/notify-send -u normal 'Battery Full!'",
          "on-discharging-critical": "${pkgs.libnotify}/bin/notify-send -u critical 'Very Low Battery'",
          "on-discharging-warning": "${pkgs.libnotify}/bin/notify-send -u normal 'Low Battery'"
        },
        "format": "{icon}",
        "format-icons": [
          "󰂎",
          "󰁺",
          "󰁻",
          "󰁼",
          "󰁽",
          "󰁾",
          "󰁿",
          "󰂀",
          "󰂁",
          "󰂂",
          "󰁹"
        ],
        "interval": 5,
        "states": {
          "critical": 15,
          "warning": 30
        },
        "tooltip-format": "{capacity}% {timeTo}"
      },
      "cava": {
        "autosens": 1,
        "bar_delimiter": 0,
        "bars": 15,
        "format-icons": [
          "▁ ",
          "▂ ",
          "▃ ",
          "▄ ",
          "▅ ",
          "▆ ",
          "▇ ",
          "█ "
        ],
        "framerate": 60,
        "higher_cutoff_freq": 10000,
        "input_delay": 1,
        "lower_cutoff_freq": 50,
        "method": "pipewire",
        "monstercat": false,
        "noise_reduction": 0.77,
        "reverse": false,
        "sleep_timer": 5,
        "source": "auto",
        "stereo": true,
        "waves": false
      },
      "clock": {
        "calendar": {
          "format": {
            "days": "<span color='#ecc6d9'><b>{}</b></span>",
            "months": "<span color='#ffead3'><b>{}</b></span>",
            "today": "<span color='#ff6699'><b><u>{}</u></b></span>",
            "weekdays": "<span color='#ffcc66'><b>{}</b></span>",
            "weeks": "<span color='#99ffdd'><b>W{}</b></span>"
          },
          "mode": "year",
          "mode-mon-col": 3,
          "on-click-right": "mode",
          "on-scroll": 1,
          "weeks-pos": "right"
        },
        "format": "{:%a, %b %d %Y - %H:%M}",
        "tooltip-format": "<tt><small>{calendar}</small></tt>"
      },
      "cpu": {
        "format": "{icon}",
        "format-icons": [
          ""
        ],
        "interval": 2,
        "states": {
          "critical": 90
        }
      },
      "custom/arrow-left": {
        "format": "  ",
        "tooltip": false
      },
      "niri/workspaces": {
        "all-outputs": true,
        "disable-scroll": true,
        "format": "{icon}",
        "format-icons": {
          "1": "1",
          "10": "10",
          "2": "2",
          "3": "3",
          "4": "4",
          "5": "5",
          "6": "6",
          "7": "7",
          "8": "8",
          "9": "9"
        },
        "tooltip": false
      },
      "group/info": {
        "drawer": {
          "transition-duration": 300,
          "transition-left-to-right": true
        },
        "modules": [
          "custom/arrow-left",
          "idle_inhibitor",
          "cpu",
          "memory",
          "temperature",
          "battery",
          "network",
          "backlight",
          "wireplumber#sink",
          "wireplumber#source"
        ],
        "orientation": "inherit"
      },
      "height": 0,
      "idle_inhibitor": {
        "format": "{icon}",
        "format-icons": {
          "activated": "",
          "deactivated": ""
        }
      },
      "image": {
        "on-click": "exec rofi -show drun -location 7",
        "on-click-right": "exec rofi -show power-menu -modi power-menu:rofi-power-menu-niri -location 7",
        "path": "${nixos}",
        "size": 14
      },
      "layer": "top",
      "memory": {
        "format": "{icon}",
        "format-icons": [
          ""
        ],
        "interval": 2,
        "states": {
          "critical": 80
        }
      },
      "modules-center": [
       "mpris"
      ],
      "modules-left": [
        "image",
        "ext/workspaces",
        "wlr/taskbar",
        "cava"
      ],
      "modules-right": [
        "group/info",
        "tray",
        "clock"
      ],
      "network": {
        "format-disconnected": "󰖪",
        "format-ethernet": "󰈀",
        "format-wifi": "󰖩",
        "interval": 5,
        "on-click": "foot nmtui",
        "tooltip-format": "{ifname} {bandwidthDownBytes}",
        "tooltip-format-disconnected": "Disconnected",
        "tooltip-format-ethernet": "{ifname} {bandwidthDownBytes} 󰈀",
        "tooltip-format-wifi": "{essid} {bandwidthDownBytes} "
      },
      "mpris": {
     	  "format": "{player_icon} {dynamic}",
       	"format-paused": "{status_icon} <i>{dynamic}</i>",
        "max-length": 30,
       	"player-icons": {
      		"default": "▶"
       	},
       	"status-icons": {
      		"paused": "⏸"
       	},
      },
      "position": "bottom",
      "spacing": 0,
      "temperature": {
        "critical-threshold": 90,
        "format": "{icon}",
        "format-icons": [
          "",
          "",
          "",
          "",
          ""
        ],
        "interval": 5,
        "warning-threshold": 75
      },
      "tray": {
        "icon-size": 13,
        "spacing": 10,
        "tooltip": false
      },
      "wireplumber#sink": {
        "format": "{icon}",
        "format-icons": [
          "󰕿",
          "󰖀",
          "󰕾"
        ],
        "format-muted": "󰝟",
        "max-volume": 200,
        "on-click": "pavucontrol",
        "on-click-right": "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
        "scroll-step": 1,
        "tooltip-format": "{volume}%"
      },
      "wireplumber#source": {
        "format": "",
        "format-muted": "",
        "max-volume": 200,
        "node-type": "Audio/Source",
        "on-click": "pavucontrol",
        "on-click-right": "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle",
        "scroll-step": 1,
        "tooltip-format": "{volume}%"
      },
      "wlr/taskbar": {
        "format": "{icon}",
        "icon-size": 14,
        "icon-theme": "Tela-circle-dracula-dark",
        "on-click": "activate",
        "on-click-right": "close",
        "tooltip-format": "{title}"
      }
    }
    ]
  '';

  xdg.configFile."waybar/style.css".text = ''
    @define-color base00 #272e33; @define-color base01 #2e383c;
    @define-color base02 #414b50; @define-color base03 #859289;
    @define-color base04 #9da9a0; @define-color base05 #d3c6aa;
    @define-color base06 #edeada; @define-color base07 #fffbef;

    @define-color base08 #e67e80; @define-color base09 #e69875;
    @define-color base0A #dbbc7f; @define-color base0B #a7c080;
    @define-color base0C #83c092; @define-color base0D #7fbbb3;
    @define-color base0E #d699b6; @define-color base0F #9da9a0;


    * {
        border: none;
        min-height: 0;
        font-family: "D2CodingLigature Nerd Font Propo";
        font-weight: 500;
        font-size: 12px;
        letter-spacing: -0.5px;
        padding: 0px;
        margin: 2px;
    }

    window#waybar {
        background: @base00;
        border-radius: 4px;
    }

    tooltip {
        background-color: @base00;
        font-size: 2px;
        color: @base05;
    }

    tooltip label {
        margin: 2px;
    }

    window#waybar.empty #window {
        font-size: 0px;
        background-color: transparent;
    }

    #clock,
    #custom-arrow-left,
    #temperature,
    #cava,
    #tray,
    #cpu,
    #backlight,
    #memory,
    #battery,
    #network,
    #idle_inhibitor,
    #wireplumber {
        padding: 2px 6px;
        border-radius: 4px;
    }

    #image {
        padding: 2px 4px;
        border-radius: 4px;
    }

    #taskbar,
    #workspaces {
        background-color: @base00;
        border-radius: 4px;
    }

    #workspaces button {
        all: initial;
        min-width: 0;
        box-shadow: inset 0 -3px transparent;
        color: @lavender;
        padding: 3px 4px;
        background-color: @base00;
        border-radius: 4px;
    }

    #workspaces button.active {
        color: @base05;
        background-color: @base01;
        border: 0px;
        border-bottom: 0px;
    }

    #workspaces button.urgent {
        background-color: @base01;
        color: @base0A;
        border: 0px;
        border-bottom: 0px;
    }

    #cava.silent,
    #workspaces button.empty {
        background-color: transparent;
        color: transparent;
        border: 0px;
        border-bottom: 0px;
    }

    #clock {
        background-color: @base01;
        color: @base05;
    }

    #taskbar button,
    #image,
    #idle_inhibitor,
    #temperature,
    #window,
    #cpu,
    #backlight,
    #memory,
    #network,
    #wireplumber,
    #battery,
    #tray {
        background-color: @base01;
        color: @base05;
    }

    #cava {
        background-color: @base00;
        color: @base05;
        padding-right: 0px;
        padding-left: 6px;
    }

    #taskbar button {
        padding-left: 1px;
        padding-right: 1px;
        padding-top: 0px;
        padding-bottom: 0px;
    }

    #taskbar button.active {
        background-color: @base02;
    }

    #temperature.critical,
    #cpu.critical,
    #memory.critical {
        color: @base0A;
    }

    #battery.warning,
    #battery.critical,
    #battery.urgent {
        color: @base0A;
    }

    #window {
        min-width: 20px;
    }

    #cava {
        min-width: 20px;
    }
  '';
}
