{ config, lib, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    systemd.target = "graphical-session.target";
    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        spacing = 0;
        height = 0;

        modules-left = [ "image" "niri/workspaces"  "wlr/taskbar" ];

        modules-center = [ ];

        modules-right = [ "tray" "idle_inhibitor" "cpu" "memory" "temperature" "battery" "network" "backlight" "wireplumber#sink" "wireplumber#source" "clock" ];

        "wlr/taskbar" = {
          format = "{icon}";
          icon-size = 16;
          icon-theme = "Tela-circle-dracula-dark";
          tooltip-format = "{title}";
          on-click = "activate";
        };

        "image" = {
          path = "/home/sunny/Pictures/walls/NixOS.png";
          size = 16;
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
            format = "{:%H:%M}" ;
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
    @define-color rosewater #f5e0dc;
    @define-color flamingo #f2cdcd;
    @define-color pink #f5c2e7;
    @define-color mauve #cba6f7;
    @define-color red #f38ba8;
    @define-color maroon #eba0ac;
    @define-color peach #fab387;
    @define-color yellow #f9e2af;
    @define-color green #a6e3a1;
    @define-color teal #94e2d5;
    @define-color sky #89dceb;
    @define-color sapphire #74c7ec;
    @define-color blue #89b4fa;
    @define-color lavender #adb6f4;
    @define-color purple #9da5e1;
    @define-color text #cdd6f4;
    @define-color subtext1 #bac2de;
    @define-color subtext0 #a6adc8;
    @define-color overlay2 #9399b2;
    @define-color overlay1 #7f849c;
    @define-color overlay0 #6c7086;
    @define-color surface2 #585b70;
    @define-color surface1 #45475a;
    @define-color surface0 #313244;
    @define-color base #1e1e2e;
    @define-color mantle #181825;
    @define-color crust #11111b;

    * {
        border: none;
        min-height: 0;
        font-family: "D2CodingLigature Nerd Font Propo";
        font-weight: 500;
        font-size: 13px;
        letter-spacing: -1px;
        padding: 0px;
        margin: 2px;
    }

    window#waybar {
        background: @crust;
        border: 0px;
        border-radius: 4px;
    }

    tooltip {
        background-color: @base;
        border: 0px;
        font-size: 2px;
        color: @text;
    }

    tooltip label {
        margin: 2px;
    }

    window#waybar.empty #window {
        font-size: 0px;
        border: 0px;
        background-color: transparent;
    }

    #image {
        border-radius: 4px;
    }

    #clock,
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

    #window,
    #mpris {
        padding: 2px 6px;
        border-radius: 4px;
    }

    #taskbar,
    #workspaces {
        background-color: @crust;
        border-radius: 4px;
    }

    #workspaces button {
        all: initial;
        min-width: 0;
        box-shadow: inset 0 -3px transparent;
        color: @lavender;
        padding: 3px 5px;
        background-color: @crust;
        border: 0px;
        border-radius: 4px;
    }

    #workspaces button.active {
        color: @text;
        background-color: @base;
    }

    #workspaces button.urgent {
        background-color: @base;
        color: @red;
        border: 0px;
    }

    #cava.silent,
    #workspaces button.empty {
        background-color: transparent;
        color: transparent;
        border: 0px;
    }

    #clock {
        background-color: @base;
        border: 0px;
        color: @text;
    }

    #image,
    #cava,
    #taskbar,
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
        background-color: @base;
        border: 0px;
        color: @text;
    }

    #cava {
        padding-right: 0px;
        padding-left: 6px;
    }

    #taskbar button {
        padding-left: 2px;
        padding-right: 2px;
        padding-top: 0px;
        padding-bottom: 0px;
    }

    #temperature.critical,
    #cpu.critical,
    #memory.critical {
        color: @red;
        border: 0px;
    }

    #battery.warning,
    #battery.critical,
    #battery.urgent {
        color: @red;
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
