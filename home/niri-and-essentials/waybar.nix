{ config, lib, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "graphical-session.target";
    };
    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        spacing = 0;
        height = 0;

        modules-left = [ "image" "niri/workspaces"  "wlr/taskbar" ];

        modules-center = [ ];

        modules-right = [ "group/info" "tray" "clock" ];

        "group/info" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 300;
            transition-left-to-right = true;
          };
          modules = [ "custom/arrow-left" "idle_inhibitor" "cpu" "memory" "temperature" "battery" "network" "backlight" "wireplumber#sink" "wireplumber#source" ];
        };

        "custom/arrow-left" = {
          format ="  ";
          tooltip = false;
        };

        "wlr/taskbar" = {
          format = "{icon}";
          icon-size = 14;
          icon-theme = "Tela-circle-dracula-dark";
          tooltip-format = "{title}";
          on-click = "activate";
        };

        "image" = {
          path = "/home/sunny/Pictures/walls/NixOS.png";
          size = 14;
          on-click = "exec fuzzel";
          on-click-right = "exec logout-menu";
        };

        "niri/workspaces" = {
          format = "{icon}";
          format-icons = {
            default = "";
            active = "";
          };
          disable-scroll = true;
          all-outputs = true;
          tooltip = false;
        };

        "mpris" = {
          format = "{player_icon} {dynamic}";
          max-length = 30;
          player-icons = {
            spotify = "";
            firefox = "";
            vlc = "󰕼";
            mpv = "";
            default = "🎜";
          };
          status-icons = {
            paused = "⏸";
          };
          escape = true;
          on-click = "playerctl play-pause";
          on-click-right = "playerctl next";
          on-click-middle = "playerctl previous";
          tooltip = false;
        };

        "cava" = {
          framerate = 60;
          sleep_timer = 5;
          autosens = 1;
          bars = 15;
          lower_cutoff_freq = 50;
          higher_cutoff_freq = 10000;
          method = "pipewire";
          source = "auto";
          stereo = true;
          reverse = false;
          bar_delimiter = 0;
          monstercat = false;
          waves = false;
          noise_reduction = 0.77;
          input_delay = 2;
          format-icons  = [ "▁ " "▂ " "▃ " "▄ " "▅ " "▆ " "▇ " "█ " ];
        };

        "tray" = {
            icon-size = 13;
            spacing = 10;
            tooltip = false;
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
          tooltip = false;
        };

        "niri/window" = {
          rotate = 90;
          format = "{title}";
          max-length = 40;
        };

        "clock" = {
            format = "{:%a, %b %d %Y - %H:%M}" ;
            tooltip-format = "<tt><small>{calendar}</small></tt>";
            calendar = {
                mode = "year";
                mode-mon-col = 3;
                weeks-pos = "right";
                on-scroll = 1;
                on-click-right = "mode";
                format = {
                    months = "<span color='#ffead3'><b>{}</b></span>";
                    days = "<span color='#ecc6d9'><b>{}</b></span>";
                    weeks = "<span color='#99ffdd'><b>W{}</b></span>";
                    weekdays = "<span color='#ffcc66'><b>{}</b></span>";
                    today = "<span color='#ff6699'><b><u>{}</u></b></span>";
              };
            };
        };

        "temperature" = {
            format = "{icon}";
            format-icons = [ "" "" "" "" "" ];
            interval = 5;
            warning-threshold = 75;
            critical-threshold = 90;
        };

        "cpu" = {
            format = "{icon}";
            format-icons = [ "" ];
            interval = 2;
            states = {
                critical = 90;
            };
        };

        "memory" = {
            format = "{icon}";
            format-icons = [ "" ];
            interval = 2;
            states = {
                critical = 80;
            };
        };

        "backlight" = {
            device = "intel_backlight";
            format = "{icon}";
            format-icons = [ "󰛩" "󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖" "󰛨" ];
            on-scroll-up = "brightnessctl set +1%";
            on-scroll-down = "brightnessctl set 1%-";
            tooltip-format = "{percent}%";
        };

        "battery" = {
            format = "{icon}";
            format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
            interval = 5;
            states = {
                warning = 30;
                critical = 15;
            };
        };

        "network" = {
            format-wifi  = "󰖩";
            format-ethernet = "󰈀";
            format-disconnected  = "󰖪";
            on-click = "kitty -e nmtui";
            interval = 5;
            tooltip-format = "{ifname} {bandwidthDownBytes}";
            tooltip-format-wifi = "{essid} {bandwidthDownBytes} ";
            tooltip-format-ethernet = "{ifname} {bandwidthDownBytes} 󰈀";
            tooltip-format-disconnected = "Disconnected";
        };

        "wireplumber#sink" = {
            scroll-step = 1;
            max-volume = 200;
            format = "{icon}";
            tooltip-format = "{volume}%";
            format-icons = [ "󰕿" "󰖀" "󰕾"];
            format-muted = "󰝟";
            on-click = "pavucontrol";
	        on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };

	    "wireplumber#source" = {
	        node-type = "Audio/Source";
    	    format = "";
    	    format-muted = "";
	        tooltip-format = "{volume}%";
            on-click = "pavucontrol";
    	    on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
            scroll-step = 1;
	        max-volume = 200;
	    };

      };
    };

    style = ''
    /* Oxocarbon Dark Palette */
    @define-color base00	#161616;
    @define-color base01	#262626;
    @define-color base02	#393939;
    @define-color base03	#525252;
    @define-color base04	#dde1e6;
    @define-color base05	#f2f4f8;
    @define-color base06	#ffffff;
    @define-color base07	#08bdb9;
    @define-color base08	#3ddbd9;
    @define-color base09	#78a9ff;
    @define-color base0A	#ee5396;
    @define-color base0B	#33b1ff;
    @define-color base0C	#ff7eb6;
    @define-color base0D	#42be65;
    @define-color base0E	#be95ff;
    @define-color base0F	#82cfff;

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
        border: 0px;
        border-radius: 4px;
    }

    tooltip {
        background-color: @base01;
        border: 0px;
        font-size: 2px;
        color: @base05;
    }

    tooltip label {
        margin: 2px;
    }

    window#waybar.empty #window {
        font-size: 0px;
        border: 0px;
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
        border: 0px;
        border-radius: 4px;
    }

    #workspaces button.active {
        color: @base05;
        background-color: @base01;
    }

    #workspaces button.urgent {
        background-color: @base01;
        color: @base0A;
        border: 0px;
    }

    #cava.silent,
    #workspaces button.empty {
        background-color: transparent;
        color: transparent;
        border: 0px;
    }

    #clock {
        background-color: @base01;
        border: 0px;
        color: @base05;
    }

    #taskbar button,
    #image,
    #cava,
    #idle_inhibitor,
    #temperature,
    #window,
    #mpris,
    #cpu,
    #backlight,
    #memory,
    #network,
    #wireplumber,
    #battery,
    #tray {
        background-color: @base01;
        border: 0px;
        color: @base05;
    }

    #cava {
        padding-right: 0px;
        padding-left: 6px;
    }

    #taskbar button {
        padding-left: 1px;
        padding-right: 1px;
        padding-top: 0px;
        padding-bottom: 0px;
    }

    #temperature.critical,
    #cpu.critical,
    #memory.critical {
        color: @base0A;
        border: 0px;
    }

    #battery.warning,
    #battery.critical,
    #battery.urgent {
        color: @base0A;
        border: 0px;
    }

    #window {
        min-width: 20px;
    }

    #cava {
        min-width: 20px;
    }
    '';
  };
}
