{ config, lib, pkgs, ... }:

{
  imports = [
    ./waybar.nix
    ./services.nix
    ./foot.nix
  ];

  home.packages = with pkgs; [
    xwayland-satellite-unstable
  ];

  programs.niri = {
    package = pkgs.niri-unstable;
    config = ''
    input {
        keyboard {
            xkb {
                layout ""
                model ""
                rules ""
                variant ""
            }
            repeat-delay 600
            repeat-rate 25
            track-layout "global"
            numlock
        }
        touchpad {
            tap
            drag true
            natural-scroll
            scroll-method "two-finger"
            click-method "clickfinger"
        }
        mod-key "Super"
    }

    screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"

    prefer-no-csd

    layout {
        gaps 12
        struts {
            left 0
            right 0
            top 0
            bottom 0
        }
        focus-ring {
            width 1
            urgent-color "#ee5396"
            active-color "#f2f4f8"
            inactive-color "#dde1e6"
        }
        border { off; }
        tab-indicator {
            gap 5.000000
            width 4.000000
            length total-proportion=0.500000
            position "left"
            gaps-between-tabs 0.000000
            corner-radius 0.000000
        }
        insert-hint { color "#161616"; }
        default-column-width { proportion 0.500000; }
        preset-column-widths {
            proportion 0.333333
            proportion 0.500000
            proportion 0.666667
        }
        preset-window-heights {
            proportion 0.333333
            proportion 0.500000
            proportion 0.666667
        }
        center-focused-column "never"
    }

    cursor {
        xcursor-theme "Vimix-cursors"
        xcursor-size 24
    }

    hotkey-overlay { skip-at-startup; }

    environment {
        "CLUTTER_BACKEND" "wayland"
        "GDK_BACKEND" "wayland"
        "NIXOS_OZONE_WL" "1"
        "QT_AUTO_SCREEN_SCALE_FACTOR" "1"
        "QT_QPA_PLATFORM" "wayland"
        "QT_QPA_PLATFORMTHEME" "qtct"
        "QT_STYLE_OVERRIDE" "kvantum"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION" "1"
        "SDL_VIDEODRIVER" "wayland"
        "_JAVA_AWT_WM_NONREPARENTING" "1"
    }

    spawn-at-startup "${pkgs.pantheon.pantheon-agent-polkit}/libexec/policykit-1-pantheon/io.elementary.desktop.agent-polkit"
    spawn-sh-at-startup "${pkgs.swww}/bin/swww img $HOME/Pictures/walls/oxocarbon.jpg --transition-type outer --transition-duration=1"
    spawn-sh-at-startup "${pkgs.swaybg}/bin/swaybg -m fill -i $HOME/Pictures/walls/nobara-oxocarbon.png"

    binds {
        Mod+Space { spawn "sh" "-c" "pkill -SIGUSR2 waybar"; }
        Mod+T { spawn "${pkgs.foot}/bin/footclient"; }
        Mod+X { spawn "rofi" "-modi" "clipboard:cliphist-rofi-img" "-show" "clipboard" "-show-icons"; }
        Mod+P { spawn "sh" "-c" "niri-color-picker"; }
        Mod+D { spawn "sh" "-c" "pkill -SIGUSR1 waybar"; }
        Mod+A { spawn "rofi" "-show" "drun"; }
        Mod+Alt+L allow-when-locked=true { spawn "swaylock"; }
        Alt+Tab { spawn "rofi" "-show" "window"; }
        Alt+R { spawn "rofi" "-show" "run"; }
        Alt+B { spawn "rofi" "-show" "filebrowser"; }
        Mod+Escape { spawn "rofi" "-show" "power-menu" "-modi" "power-menu:rofi-power-menu"; }

        XF86AudioLowerVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-"; }
        XF86AudioMicMute allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"; }
        XF86AudioMute allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"; }
        XF86AudioRaiseVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+"; }
        XF86MonBrightnessDown allow-when-locked=true { spawn "${pkgs.brightnessctl}/bin/brightnessctl" "set" "5%-"; }
        XF86MonBrightnessUp allow-when-locked=true { spawn "${pkgs.brightnessctl}/bin/brightnessctl" "set" "5%+"; }

        Ctrl+Alt+Delete { quit; }
        Mod+Shift+E { quit; }

        Ctrl+Escape allow-inhibiting=false { toggle-keyboard-shortcuts-inhibit; }

        Print { screenshot; }
        Alt+Print { screenshot-window; }
        Ctrl+Print { screenshot-screen; }

        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace 9; }

        Mod+BracketLeft { consume-or-expel-window-left; }
        Mod+BracketRight { consume-or-expel-window-right; }

        Mod+C { center-column; }
        Mod+Comma { consume-window-into-column; }

        Mod+Ctrl+1 { move-column-to-index 1; }
        Mod+Ctrl+2 { move-column-to-index 2; }
        Mod+Ctrl+3 { move-column-to-index 3; }
        Mod+Ctrl+4 { move-column-to-index 4; }
        Mod+Ctrl+5 { move-column-to-index 5; }
        Mod+Ctrl+6 { move-column-to-index 6; }
        Mod+Ctrl+7 { move-column-to-index 7; }
        Mod+Ctrl+8 { move-column-to-index 8; }
        Mod+Ctrl+9 { move-column-to-index 9; }

        Mod+Ctrl+C { center-visible-columns; }
        Mod+Ctrl+Down { move-window-down; }
        Mod+Ctrl+End { move-column-to-last; }
        Mod+Ctrl+F { expand-column-to-available-width; }
        Mod+Ctrl+G { move-column-to-workspace-up; }
        Mod+Ctrl+Home { move-column-to-first; }
        Mod+Ctrl+I { move-window-up; }
        Mod+Ctrl+J { move-column-left; }
        Mod+Ctrl+K { move-window-down; }
        Mod+Ctrl+L { move-column-right; }
        Mod+Ctrl+Left { move-column-left; }
        "Mod+Ctrl+Page_Down" { move-column-to-workspace-down; }
        "Mod+Ctrl+Page_Up" { move-column-to-workspace-up; }
        Mod+Ctrl+R { reset-window-height; }
        Mod+Ctrl+Right { move-column-right; }
        Mod+Ctrl+Shift+WheelScrollDown { move-column-right; }
        Mod+Ctrl+Shift+WheelScrollUp { move-column-left; }
        Mod+Ctrl+T { move-column-to-workspace-down; }
        Mod+Ctrl+Up { move-window-up; }
        Mod+Ctrl+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
        Mod+Ctrl+WheelScrollLeft { move-column-left; }
        Mod+Ctrl+WheelScrollRight { move-column-right; }
        Mod+Ctrl+WheelScrollUp cooldown-ms=150 { move-column-to-workspace-up; }
        Mod+Down { focus-window-down; }
        Mod+End { focus-column-last; }
        Mod+Equal { set-column-width "+10%"; }
        Mod+F { maximize-column; }

        Mod+H { focus-workspace-down; }
        Mod+Y { focus-workspace-up; }

        Mod+Home { focus-column-first; }
        Mod+I { focus-window-up; }
        Mod+J { focus-column-left; }
        Mod+K { focus-window-down; }
        Mod+L { focus-column-right; }
        Mod+Left { focus-column-left; }
        Mod+Minus { set-column-width "-10%"; }
        Mod+O repeat=false { toggle-overview; }
        "Mod+Page_Down" { focus-workspace-down; }
        "Mod+Page_Up" { focus-workspace-up; }
        Mod+Period { expel-window-from-column; }
        Mod+Q { close-window; }
        Mod+R { switch-preset-column-width; }
        Mod+Right { focus-column-right; }
        Mod+Shift+Ctrl+Down { move-column-to-monitor-down; }
        Mod+Shift+Ctrl+I { move-column-to-monitor-up; }
        Mod+Shift+Ctrl+J { move-column-to-monitor-left; }
        Mod+Shift+Ctrl+K { move-column-to-monitor-down; }
        Mod+Shift+Ctrl+L { move-column-to-monitor-right; }
        Mod+Shift+Ctrl+Left { move-column-to-monitor-left; }
        Mod+Shift+Ctrl+Right { move-column-to-monitor-right; }
        Mod+Shift+Ctrl+Up { move-column-to-monitor-up; }
        Mod+Shift+Down { focus-monitor-down; }
        Mod+Shift+Equal { set-window-height "+10%"; }
        Mod+Shift+F { fullscreen-window; }
        Mod+Shift+G { move-workspace-up; }
        Mod+Shift+I { focus-monitor-up; }
        Mod+Shift+J { focus-monitor-left; }
        Mod+Shift+K { focus-monitor-down; }
        Mod+Shift+L { focus-monitor-right; }
        Mod+Shift+Left { focus-monitor-left; }
        Mod+Shift+Minus { set-window-height "-10%"; }
        Mod+Shift+P { power-off-monitors; }
        "Mod+Shift+Page_Down" { move-workspace-down; }
        "Mod+Shift+Page_Up" { move-workspace-up; }
        Mod+Shift+R { switch-preset-window-height; }
        Mod+Shift+Right { focus-monitor-right; }
        Mod+Shift+Slash { show-hotkey-overlay; }
        Mod+Shift+T { move-workspace-down; }
        Mod+Shift+Up { focus-monitor-up; }
        Mod+Shift+V { switch-focus-between-floating-and-tiling; }
        Mod+Shift+WheelScrollDown { focus-column-right; }
        Mod+Shift+WheelScrollUp { focus-column-left; }
        Mod+Up { focus-window-up; }

        Mod+V { toggle-window-floating; }
        Mod+W { toggle-column-tabbed-display; }

        Mod+WheelScrollDown cooldown-ms=150 { focus-workspace-down; }
        Mod+WheelScrollLeft { focus-column-left; }
        Mod+WheelScrollRight { focus-column-right; }
        Mod+WheelScrollUp cooldown-ms=150 { focus-workspace-up; }
    }

    window-rule {
        draw-border-with-background false
        geometry-corner-radius 4.000000 4.000000 4.000000 4.000000
        clip-to-geometry true
    }
    window-rule {
        match is-active=true
        opacity 0.950000
    }
    window-rule {
        match is-active=false
        opacity 0.800000
    }
    window-rule {
        match app-id="^firefox$" title="^Picture-in-Picture$"
        open-floating true
    }

    layer-rule {
        match namespace="^wallpaper$"
        place-within-backdrop true
    }

    gestures { hot-corners { off; }; }
    '';
  };
}
