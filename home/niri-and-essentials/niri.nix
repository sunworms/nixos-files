{ config, lib, pkgs, ... }:

{
  imports = [
    ./lockscreen.nix
    ./notifs.nix
    ./terminal.nix
    ./waybar.nix
    ./portals.nix
  ];

  home.packages = with pkgs; [
    pantheon.pantheon-agent-polkit
  ];

  programs.niri = {
    package = pkgs.niri-unstable;

    settings = {

      hotkey-overlay.skip-at-startup = true;
      prefer-no-csd = true;

      input = {
        focus-follows-mouse.enable = false;
        keyboard.numlock = true;
        mod-key = "Super";
        mouse.enable = true;
        power-key-handling.enable = true;
        touch.enable = true;
        touchpad = {
          enable = true;
          click-method = "clickfinger";
          drag = true;
          dwt = false;
          dwtp = false;
          natural-scroll = true;
          scroll-method = "two-finger";
          tap = true;
        };
        warp-mouse-to-focus.enable = false;
      };

      layout = {
        border.enable = false;
        focus-ring = {
          enable = true;
          width = 1;
          active.color = "#adb6f4";
          inactive.color = "#bac2de";
          urgent.color = "#f38ba8";
        };
        shadow.enable = false;
        insert-hint = {
          enable = true;
          display.color = "#1e1e2e";
        };
        default-column-width = { proportion = 1. / 2.; };
        preset-column-widths = [
          { proportion = 1. / 3.; }
          { proportion = 1. / 2.; }
          { proportion = 2. / 3.; }
        ];
        preset-window-heights = [
          { proportion = 1. / 3.; }
          { proportion = 1. / 2.; }
          { proportion = 2. / 3.; }
        ];
        always-center-single-column = false;
        center-focused-column = "never";
        tab-indicator.enable = true;
        gaps = 12;
        struts = {
          left = 0;
          right = 0;
          top = 0;
          bottom = 0;
        };
      };

      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

      cursor = {
        hide-after-inactive-ms = null;
        hide-when-typing = false;
        theme = "catppuccin-mocha-dark-cursors";
        size = 24;
      };

      environment = {
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORM = "wayland";
        QT_QPA_PLATFORMTHEME = "qt5ct";
        QT_QPA_PLATFORMTHEME_QT6 = "qt6ct";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        QT_AUTO_SCREEN_SCALE_FACTOR = "1";
        QT_STYLE_OVERRIDE = "kvantum";
        _JAVA_AWT_WM_NONREPARENTING = "1";
        GDK_BACKEND = "wayland";
        SDL_VIDEODRIVER = "wayland";
        CLUTTER_BACKEND = "wayland";
      };

      animations.enable = true;

      window-rules = [
        {
          draw-border-with-background = false;
          geometry-corner-radius =
            let
              r = 4.0;
            in
            {
              top-left = r;
              top-right = r;
              bottom-left = r;
              bottom-right = r;
            };
          clip-to-geometry = true;
        }
        {
          matches = [
            {
              is-active = true;
            }
          ];
          opacity = 0.95;
        }
        {
          matches = [
            {
              is-active = false;
            }
          ];
          opacity = 0.8;
        }
        {
          matches = [
            {
              app-id = "^firefox$";
              title = "^Picture-in-Picture$";
            }
          ];
          open-floating = true;
        }
      ];

      layer-rules = [
        {
          matches = [
            {
              namespace = "^wallpaper$";
            }
          ];
          place-within-backdrop = true;
        }
      ];

      gestures.hot-corners.enable = false;

      spawn-at-startup = [
        { sh = "mako"; }
        { sh = "swww-daemon"; }
        { sh = "${pkgs.pantheon.pantheon-agent-polkit}/libexec/policykit-1-pantheon//io.elementary.desktop.agent-polkit"; }
        { sh = "sleep 2 && swww img ~/Pictures/walls/basement.jpg"; }
        { sh = "swaybg -m fill -i ~/Pictures/walls/disco.png"; }
        { sh = "swayidle -w timeout 600 'niri msg action power-off-monitors' timeout 300 'swaylock' before-sleep 'swaylock'"; }
        { sh = "wl-paste --watch cliphist store"; }
        { sh = "jamesdsp --tray"; }
      ];

      binds = with config.lib.niri.actions; let
        sh = spawn "sh" "-c";
      in {

        "Mod+Shift+Slash".action = show-hotkey-overlay;
        "Mod+A".action = spawn "fuzzel";
        "Mod+T".action = sh "foot";
        "Mod+Shift+Space".action = spawn "pkill" "waybar";
        "Mod+Space".action = spawn "waybar";
        "Mod+D".action = sh "pkill -SIGUSR1 waybar";
        "Mod+Escape".action = spawn "logout-menu";
        "Mod+X".action = spawn "cliphist-fuzzel-img";
        "Mod+Alt+L".action = spawn "swaylock";
        "Mod+P".action = sh ''niri msg pick-color | awk '$1 == "Hex:" { printf "%s", $2 }' | wl-copy"'';

        "XF86AudioRaiseVolume" = {
          allow-when-locked = true;
          action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+";
        };
        "XF86AudioLowerVolume" = {
          allow-when-locked = true;
          action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-";
        };
        "XF86AudioMute" = {
          allow-when-locked = true;
          action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
        };
        "XF86AudioMicMute" = {
          allow-when-locked = true;
          action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle";
        };
        "XF86MonBrightnessUp" = {
          allow-when-locked = true;
          action = spawn "brightnessctl" "set" "5%+";
        };
        "XF86MonBrightnessDown" = {
          allow-when-locked = true;
          action = spawn "brightnessctl" "set" "5%-";
        };

        "Mod+O" = {
          repeat = false;
          action = toggle-overview;
        };
        "Mod+Q".action = close-window;

        "Mod+Left".action = focus-column-left;
        "Mod+Right".action = focus-column-right;
        "Mod+Down".action = focus-window-down;
        "Mod+Up".action = focus-window-up;
        "Mod+J".action = focus-column-left;
        "Mod+L".action = focus-column-right;
        "Mod+K".action = focus-window-down;
        "Mod+I".action = focus-window-up;

        "Mod+Ctrl+Left".action = move-column-left;
        "Mod+Ctrl+Right".action = move-column-right;
        "Mod+Ctrl+Down".action = move-window-down;
        "Mod+Ctrl+Up".action = move-window-up;
        "Mod+Ctrl+J".action = move-column-left;
        "Mod+Ctrl+L".action = move-column-right;
        "Mod+Ctrl+K".action = move-window-down;
        "Mod+Ctrl+I".action = move-window-up;

        "Mod+Home".action = focus-column-first;
        "Mod+End".action = focus-column-last;
        "Mod+Ctrl+Home".action = move-column-to-first;
        "Mod+Ctrl+End".action = move-column-to-last;

        "Mod+Shift+Left".action = focus-monitor-left;
        "Mod+Shift+Down".action = focus-monitor-down;
        "Mod+Shift+Up".action = focus-monitor-up;
        "Mod+Shift+Right".action = focus-monitor-right;
        "Mod+Shift+J".action = focus-monitor-left;
        "Mod+Shift+K".action = focus-monitor-down;
        "Mod+Shift+I".action = focus-monitor-up;
        "Mod+Shift+L".action = focus-monitor-right;

        "Mod+Shift+Ctrl+Left".action = move-column-to-monitor-left;
        "Mod+Shift+Ctrl+Down".action = move-column-to-monitor-down;
        "Mod+Shift+Ctrl+Up".action = move-column-to-monitor-up;
        "Mod+Shift+Ctrl+Right".action = move-column-to-monitor-right;
        "Mod+Shift+Ctrl+J".action = move-column-to-monitor-left;
        "Mod+Shift+Ctrl+K".action = move-column-to-monitor-down;
        "Mod+Shift+Ctrl+I".action = move-column-to-monitor-up;
        "Mod+Shift+Ctrl+L".action = move-column-to-monitor-right;

        "Mod+Page_Down".action = focus-workspace-down;
        "Mod+Page_Up".action = focus-workspace-up;
        "Mod+H".action = focus-workspace-down;
        "Mod+Y".action = focus-workspace-up;
        "Mod+Ctrl+Page_Down".action = move-column-to-workspace-down;
        "Mod+Ctrl+Page_Up".action = move-column-to-workspace-up;
        "Mod+Ctrl+T".action = move-column-to-workspace-down;
        "Mod+Ctrl+G".action = move-column-to-workspace-up;

        "Mod+Shift+Page_Down".action = move-workspace-down;
        "Mod+Shift+Page_Up".action = move-workspace-up;
        "Mod+Shift+T".action = move-workspace-down;
        "Mod+Shift+G".action = move-workspace-up;

        "Mod+WheelScrollDown" = {
          cooldown-ms = 150;
          action = focus-workspace-down;
        };
        "Mod+WheelScrollUp" = {
          cooldown-ms = 150;
          action = focus-workspace-up;
        };
        "Mod+Ctrl+WheelScrollDown" = {
          cooldown-ms = 150;
          action = move-column-to-workspace-down;
        };
        "Mod+Ctrl+WheelScrollUp" = {
          cooldown-ms = 150;
          action = move-column-to-workspace-up;
        };

        "Mod+WheelScrollRight".action = focus-column-right;
        "Mod+WheelScrollLeft".action = focus-column-left;
        "Mod+Ctrl+WheelScrollRight".action = move-column-right;
        "Mod+Ctrl+WheelScrollLeft".action = move-column-left;

        "Mod+Shift+WheelScrollDown".action = focus-column-right;
        "Mod+Shift+WheelScrollUp".action = focus-column-left;
        "Mod+Ctrl+Shift+WheelScrollDown".action = move-column-right;
        "Mod+Ctrl+Shift+WheelScrollUp".action = move-column-left;

        "Mod+1".action = focus-workspace 1;
        "Mod+2".action = focus-workspace 2;
        "Mod+3".action = focus-workspace 3;
        "Mod+4".action = focus-workspace 4;
        "Mod+5".action = focus-workspace 5;
        "Mod+6".action = focus-workspace 6;
        "Mod+7".action = focus-workspace 7;
        "Mod+8".action = focus-workspace 8;
        "Mod+9".action = focus-workspace 9;
        "Mod+Ctrl+1".action = move-column-to-index 1;
        "Mod+Ctrl+2".action = move-column-to-index 2;
        "Mod+Ctrl+3".action = move-column-to-index 3;
        "Mod+Ctrl+4".action = move-column-to-index 4;
        "Mod+Ctrl+5".action = move-column-to-index 5;
        "Mod+Ctrl+6".action = move-column-to-index 6;
        "Mod+Ctrl+7".action = move-column-to-index 7;
        "Mod+Ctrl+8".action = move-column-to-index 8;
        "Mod+Ctrl+9".action = move-column-to-index 9;

        "Mod+BracketLeft".action = consume-or-expel-window-left;
        "Mod+BracketRight".action = consume-or-expel-window-right;

        "Mod+Comma".action = consume-window-into-column;
        "Mod+Period".action = expel-window-from-column;

        "Mod+R".action = switch-preset-column-width;
        "Mod+Shift+R".action = switch-preset-window-height;
        "Mod+Ctrl+R".action = reset-window-height;

        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = fullscreen-window;
        "Mod+Ctrl+F".action = expand-column-to-available-width;

        "Mod+C".action = center-column;
        "Mod+Ctrl+C".action = center-visible-columns;

        "Mod+Minus".action = set-column-width "-10%";
        "Mod+Equal".action = set-column-width "+10%";

        "Mod+Shift+Minus".action = set-window-height "-10%";
        "Mod+Shift+Equal".action = set-window-height "+10%";

        "Mod+V".action = toggle-window-floating;
        "Mod+Shift+V".action = switch-focus-between-floating-and-tiling;

        "Mod+W".action = toggle-column-tabbed-display;

        "Print".action = screenshot;
        "Ctrl+Print".action = screenshot-window;

        "Ctrl+Escape" = {
          allow-inhibiting = false;
          action = toggle-keyboard-shortcuts-inhibit;
        };

        "Mod+Shift+E".action = quit;
        "Ctrl+Alt+Delete".action = quit;

        "Mod+Shift+P".action = power-off-monitors;

      };
    };
  };
}
