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

        modules-left = [ "clock" "cpu" "memory" "temperature" ];

        modules-center = [ "wlr/taskbar" ];

        modules-right = [ "tray" "battery" "network" "backlight" "pulseaudio" ];

        "wlr/taskbar" = {
            format = "{icon}";
            icon-size = 22;
            on-click = "activate";
        };

        "tray" = {
            icon-size = 13;
            spacing = 10;
            tooltip = false;
        };

        "clock" = {
            format = "{:%H:%M - %a, %d %b %Y}";
            tooltip = false;
        };

        "temperature" = {
            format = "temp {temperatureC}°C";
            interval = 5;
            warning-threshold = 75;
            critical-threshold = 90;
            tooltip = false;
        };

        "cpu" = {
            format = "cpu {usage}%";
            interval = 2;

            states = {
                critical = 90;
            };
        };

        "memory" = {
            format = "mem {percentage}%";
            interval = 2;

            states = {
                critical = 80;
            };
        };

        "backlight" = {
            device = "intel_backlight";
            format = "lux {percent}%";
            on-scroll-up = "brightnessctl set +1%";
            on-scroll-down = "brightnessctl set 1%-";
            tooltip = false;
        };

        "battery" = {
            format = "bat {capacity}%";
            interval = 5;
            states = {
                warning = 20;
                critical = 10;
            };
            tooltip = false;
        };

        "network" = {
            format-wifi  = "wifi {bandwidthDownBytes}";
            format-ethernet = "enth {bandwidthDownBytes}";
            format-disconnected  = "no network";
            on-click = "kitty -e nmtui";
            interval = 5;
            tooltip = false;
        };

        "pulseaudio" = {
            scroll-step = 5;
            max-volume = 150;
            format = "vol {volume}%";
            format-bluetooth = "vol {volume}%";
            format-muted = "muted";
            nospacing = 1;
            on-click = "pavucontrol";
            tooltip = false;
        };

      };

      secondBar = {
        layer = "top";
        position = "top";
        spacing = 0;
        height = 0;

        modules-left = [ "image" "niri/workspaces" "cava" ];

        modules-center = [ "niri/window" ];

        modules-right = [ "idle_inhibitor" "mpris" ];

        "image" = {
          path = "/home/sunny/Pictures/walls/haruta.jpg";
          size = 20;
          on-click = "exec fuzzel";
          on-click-right = "exec logout-menu";
        };

        "niri/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          tooltip = false;
        };

        "niri/window" = {
          format = "{title}";
          max-length = 40;
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
          tooltip = false;
        };

        "mpris" = {
          format = "{player_icon} {dynamic}";
          max-length = 40;
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
          bars = 20;
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
      margin: 8px;
    }

    window#waybar.empty #window {
        font-size: 0px;
        border: 0px;
        background-color: transparent;
    }

    #image {
        margin: 6px 0px 6px 6px;
        padding: 2px 2px;
        border-radius: 4px;
    }

    #temperature,
    #clock,
    #tray,
    #cpu,
    #backlight,
    #memory,
    #battery,
    #network,
    #pulseaudio {
        margin: 6px 6px 6px 0px;
        padding: 3px 7px;
      border-radius: 4px;
    }

    #cava,
    #idle_inhibitor {
        margin: 6px 6px 6px 0px;
        padding: 3px 7px;
        border-radius: 4px;
    }

    #window,
    #mpris {
        margin: 6px 6px 6px 0px;
        padding: 0px 7px;
        border-radius: 4px;
    }

    #taskbar {
        margin: 6px 6px 6px 0px;
        border-radius: 4px;
    }

    #workspaces {
        margin: 6px 0px 6px 6px;
        border-radius: 4px;
    }

    #workspaces button {
        all: initial;
        min-width: 0;
        box-shadow: inset 0 -3px transparent;
        padding: 3px 5px;
        color: @lavender;
        background-color: @crust;
        border: 0px;
        border-radius: 4px;
        margin-right: 2px;
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
        margin-left: 5px;
    }

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
    #pulseaudio,
    #battery,
    #tray {
        background-color: @base;
        border: 0px;
        color: @text;
    }

    #cava {
        margin-left: 4px;
        padding-right: 0px;
        padding-left: 7px;
    }

    #taskbar button {
        padding: 0px;
        padding-right: 2px;
        padding-left: 2px;
    }

    #network {
      min-width: 90px;
    }

    #cpu,
    #memory,
    #battery,
    #backlight,
    #pulseaudio {
      min-width: 50px;
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
    '';
  };
}
