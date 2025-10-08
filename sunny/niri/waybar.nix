{ config, lib, pkgs, ... }:

{
  stylix.targets.waybar.enable = false;
  
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

        modules-left = [
            "image"
            "niri/workspaces"
            "wlr/taskbar"
            "cava"
        ];
        modules-center = [];
        modules-right = [
            "group/info"
            "tray"
            "clock"
        ];

        "group/info" = {
          drawer = {
            transition-duration = 300;
            transition-left-to-right = true;
          };
          modules = [
            "custom/arrow-left"
            "idle_inhibitor"
            "cpu"
            "memory"
            "temperature"
            "battery"
            "network"
            "backlight"
            "wireplumber#sink"
            "wireplumber#source"
          ];
          orientation = "inherit";
        };

        "custom/arrow-left" = {
          format = "  ";
          tooltip = false;
        };

        "backlight" = {
          device = "intel_backlight";
          format = "{icon}";
          format-icons= [ "󰛩" "󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖" "󰛨" ];
          on-scroll-down = "${pkgs.brightnessctl}/bin/brightnessctl set 1%-";
          on-scroll-up = "${pkgs.brightnessctl}/bin/brightnessctl set +1%";
          tooltip-format = "{percent}%";
        };

        "battery" = {
          format = "{icon}";
          format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          interval = 5;
          states = {
            critical = 15;
            warning = 30;
          };
          tooltip-format = "{capacity}% {timeTo}";
          events = {
            on-discharging-warning = "${pkgs.libnotify}/bin/notify-send -u normal 'Low Battery'";
            on-discharging-critical = "${pkgs.libnotify}/bin/notify-send -u critical 'Very Low Battery'";
            on-charging-100 = "${pkgs.libnotify}/bin/notify-send -u normal 'Battery Full!'";
          };
        };

        "clock" = {
          calendar = {
            format = {
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              months = "<span color='#ffead3'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
            };
            mode = "year";
            mode-mon-col = 3;
            on-click-right = "mode";
            on-scroll = 1;
            weeks-pos = "right";
          };
          format = "{:%a, %b %d %Y - %H:%M}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
        };

        "cpu" = {
          format = "{icon}";
          format-icons = [ "" ];
          interval = 2;
          states = {
            critical = 90;
          };
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };

        "image" = {
          on-click = "exec ${pkgs.rofi}/bin/rofi -show drun -location 7";
          on-click-right = "exec ${pkgs.rofi}/bin/rofi -show power-menu -modi power-menu:rofi-power-menu -location 7";
          path = "/home/sunny/Pictures/walls/NixOS.png";
          size = 14;
        };

        "memory" = {
          format = "{icon}";
          format-icons = [ "" ];
          interval = 2;
          states = {
            critical = 80;
          };
        };

        "network" = {
          format-disconnected = "󰖪";
          format-ethernet = "󰈀";
          format-wifi = "󰖩";
          interval = 5;
          on-click = "${pkgs.foot}/bin/foot -e nmtui";
          tooltip-format = "{ifname} {bandwidthDownBytes}";
          tooltip-format-disconnected = "Disconnected";
          tooltip-format-ethernet = "{ifname} {bandwidthDownBytes} 󰈀";
          tooltip-format-wifi = "{essid} {bandwidthDownBytes} ";
        };

        "niri/workspaces" = {
          all-outputs = true;
          disable-scroll = true;
          format = "{icon}";
          format-icons = {
            "1" = "1";
		        "2" = "2";
		        "3" = "3";
		        "4" = "4";
		        "5" = "5";
		        "6" = "6";
		        "7" = "7";
		        "8" = "8";
		        "9" = "9";
		        "10" = "10";
          };
          tooltip = false;
        };

        "temperature" = {
          critical-threshold = 90;
          format = "{icon}";
          format-icons = [ "" "" "" "" "" ];
          interval = 5;
          warning-threshold = 75;
        };

        "tray" = {
          icon-size = 13;
          spacing = 10;
          tooltip = false;
        };

        /*"mpris" = {
          format = "{player_icon} {dynamic}";
          format-paused = "{status_icon} <i>{dynamic}</i>";
          player-icons = {
            default = "▶";
          };
          status-icons = {
            paused = "⏸";
          };
          max-length = 30;
          on-click = "${pkgs.playerctl}/bin/playerctl play-pause";
          on-doucle-click = "${pkgs.playerctl}/bin/playerctl next";
          on-click-right = "${pkgs.playerctl}/bin/playerctl previous";
        };*/

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
          input_delay = 1;
          format-icons= ["▁ " "▂ " "▃ " "▄ " "▅ " "▆ " "▇ " "█ " ];
        };

        "wlr/taskbar" = {
          format = "{icon}";
          icon-size = 14;
          icon-theme = "Tela-circle-dracula-dark";
          on-click = "activate";
          on-click-right = "close";
          tooltip-format = "{title}";
        };

        "wireplumber#sink" = {
          format = "{icon}";
          format-icons = [ "󰕿" "󰖀" "󰕾" ];
          format-muted = "󰝟";
          max-volume = 200;
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
          on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          scroll-step = 1;
          tooltip-format = "{volume}%";
        };

        "wireplumber#source" = {
          format = "";
          format-muted = "";
          max-volume = 200;
          node-type = "Audio/Source";
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
          on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          scroll-step = 1;
          tooltip-format = "{volume}%";
        };
      };
    };

    style = ''
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
          background-color: @base03;
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
  };
}
