{ config, lib, pkgs, ... }:

{
  imports = [
    ./lockscreen.nix
    ./notifs.nix
    ./terminal.nix
    ./waybar.nix
    ./portals.nix
  ];

  programs.niri = {
    package = pkgs.niri-unstable;
    config = ''
    // This config is in the KDL format: https://kdl.dev
    // "/-" comments out the following node.
    // Check the wiki for a full description of the configuration:
    // https://github.com/YaLTeR/niri/wiki/Configuration:-Introduction

    // Input device configuration.
    // Find the full list of options on the wiki:
    // https://github.com/YaLTeR/niri/wiki/Configuration:-Input
    input {
    //    focus-follows-mouse
        keyboard {
            xkb {
                // You can set rules, model, layout, variant and options.
                // For more information, see xkeyboard-config(7).

                // For example:
                // layout "us,ru"
                // options "grp:win_space_toggle,compose:ralt,ctrl:nocaps"
            }

            // Enable numlock on startup, omitting this setting disables it.
            numlock
        }

        // Next sections include libinput settings.
        // Omitting settings disables them, or leaves them at their default values.
        touchpad {
            // off
            tap
            // dwt
            // dwtp
            // drag false
            // drag-lock
            natural-scroll
            // accel-speed 0.2
            // accel-profile "flat"
            // scroll-method "two-finger"
            // disabled-on-external-mouse
        }

        mouse {
            // off
            // natural-scroll
            // accel-speed 0.2
            // accel-profile "flat"
            // scroll-method "no-scroll"
        }

        trackpoint {
            // off
            // natural-scroll
            // accel-speed 0.2
            // accel-profile "flat"
            // scroll-method "on-button-down"
            // scroll-button 273
            // middle-emulation
        }

        // Uncomment this to make the mouse warp to the center of newly focused windows.
        // warp-mouse-to-focus

        // Focus windows and outputs automatically when moving the mouse into them.
        // Setting max-scroll-amount="0%" makes it work only on windows already fully on screen.
        // focus-follows-mouse max-scroll-amount="0%"
    }

    // You can configure outputs by their name, which you can find
    // by running `niri msg outputs` while inside a niri instance.
    // The built-in laptop monitor is usually called "eDP-1".
    // Find more information on the wiki:
    // https://github.com/YaLTeR/niri/wiki/Configuration:-Outputs
    // Remember to uncomment the node by removing "/-"!
    /-output "eDP-1" {
        // Uncomment this line to disable this output.
        // off

        // Resolution and, optionally, refresh rate of the output.
        // The format is "<width>x<height>" or "<width>x<height>@<refresh rate>".
        // If the refresh rate is omitted, niri will pick the highest refresh rate
        // for the resolution.
        // If the mode is omitted altogether or is invalid, niri will pick one automatically.
        // Run `niri msg outputs` while inside a niri instance to list all outputs and their modes.
        mode "1920x1080@120.030"

        // You can use integer or fractional scale, for example use 1.5 for 150% scale.
        scale 2

        // Transform allows to rotate the output counter-clockwise, valid values are:
        // normal, 90, 180, 270, flipped, flipped-90, flipped-180 and flipped-270.
        transform "normal"

        // Position of the output in the global coordinate space.
        // This affects directional monitor actions like "focus-monitor-left", and cursor movement.
        // The cursor can only move between directly adjacent outputs.
        // Output scale and rotation has to be taken into account for positioning:
        // outputs are sized in logical, or scaled, pixels.
        // For example, a 3840×2160 output with scale 2.0 will have a logical size of 1920×1080,
        // so to put another output directly adjacent to it on the right, set its x to 1920.
        // If the position is unset or results in an overlap, the output is instead placed
        // automatically.
        position x=1280 y=0
    }

    // Settings that influence how windows are positioned and sized.
    // Find more information on the wiki:
    // https://github.com/YaLTeR/niri/wiki/Configuration:-Layout
    layout {
        // Set gaps around windows in logical pixels.
        gaps 16

        // When to center a column when changing focus, options are:
        // - "never", default behavior, focusing an off-screen column will keep at the left
        //   or right edge of the screen.
        // - "always", the focused column will always be centered.
        // - "on-overflow", focusing a column will center it if it doesn't fit
        //   together with the previously focused column.
        center-focused-column "never"

        // You can customize the widths that "switch-preset-column-width" (Mod+R) toggles between.
        preset-column-widths {
            // Proportion sets the width as a fraction of the output width, taking gaps into account.
            // For example, you can perfectly fit four windows sized "proportion 0.25" on an output.
            // The default preset widths are 1/3, 1/2 and 2/3 of the output.
            proportion 0.33333
            proportion 0.5
            proportion 0.66667

            // Fixed sets the width in logical pixels exactly.
            // fixed 1920
        }

        // You can also customize the heights that "switch-preset-window-height" (Mod+Shift+R) toggles between.
        // preset-window-heights { }

        // You can change the default width of the new windows.
        default-column-width { proportion 0.5; }
        // If you leave the brackets empty, the windows themselves will decide their initial width.
        // default-column-width {}

        // By default focus ring and border are rendered as a solid background rectangle
        // behind windows. That is, they will show up through semitransparent windows.
        // This is because windows using client-side decorations can have an arbitrary shape.
        //
        // If you don't like that, you should uncomment `prefer-no-csd` below.
        // Niri will draw focus ring and border *around* windows that agree to omit their
        // client-side decorations.
        //
        // Alternatively, you can override it with a window rule called
        // `draw-border-with-background`.

        // You can change how the focus ring looks.
        focus-ring {
            // Uncomment this line to disable the focus ring.
            // off

            // How many logical pixels the ring extends out from the windows.
            width 1

            // Colors can be set in a variety of ways:
            // - CSS named colors: "red"
            // - RGB hex: "#rgb", "#rgba", "#rrggbb", "#rrggbbaa"
            // - CSS-like notation: "rgb(255, 127, 0)", rgba(), hsl() and a few others.

            // Color of the ring on the active monitor.
            active-color "#adb6f4"

            // Color of the ring on inactive monitors.
            inactive-color "#bac2de"

            // You can also use gradients. They take precedence over solid colors.
            // Gradients are rendered the same as CSS linear-gradient(angle, from, to).
            // The angle is the same as in linear-gradient, and is optional,
            // defaulting to 180 (top-to-bottom gradient).
            // You can use any CSS linear-gradient tool on the web to set these up.
            // Changing the color space is also supported, check the wiki for more info.
            //
            // active-gradient from="#80c8ff" to="#bbddff" angle=45

            // You can also color the gradient relative to the entire view
            // of the workspace, rather than relative to just the window itself.
            // To do that, set relative-to="workspace-view".
            //
            // inactive-gradient from="#505050" to="#808080" angle=45 relative-to="workspace-view"
        }

        // You can also add a border. It's similar to the focus ring, but always visible.
        border {
            // The settings are the same as for the focus ring.
            // If you enable the border, you probably want to disable the focus ring.
            off

            width 4
            active-color "#89b4fa"
            inactive-color "#505050"

            // Color of the border around windows that request your attention.
            urgent-color "#9b0000"

            // active-gradient from="#ffbb66" to="#ffc880" angle=45 relative-to="workspace-view"
            // inactive-gradient from="#505050" to="#808080" angle=45 relative-to="workspace-view"
        }

        // You can enable drop shadows for windows.
        shadow {
            // Uncomment the next line to enable shadows.
            // on

            // By default, the shadow draws only around its window, and not behind it.
            // Uncomment this setting to make the shadow draw behind its window.
            //
            // Note that niri has no way of knowing about the CSD window corner
            // radius. It has to assume that windows have square corners, leading to
            // shadow artifacts inside the CSD rounded corners. This setting fixes
            // those artifacts.
            //
            // However, instead you may want to set prefer-no-csd and/or
            // geometry-corner-radius. Then, niri will know the corner radius and
            // draw the shadow correctly, without having to draw it behind the
            // window. These will also remove client-side shadows if the window
            // draws any.
            //
            // draw-behind-window true

            // You can change how shadows look. The values below are in logical
            // pixels and match the CSS box-shadow properties.

            // Softness controls the shadow blur radius.
            softness 30

            // Spread expands the shadow.
            spread 5

            // Offset moves the shadow relative to the window.
            offset x=0 y=5

            // You can also change the shadow color and opacity.
            color "#0007"
        }

        // Struts shrink the area occupied by windows, similarly to layer-shell panels.
        // You can think of them as a kind of outer gaps. They are set in logical pixels.
        // Left and right struts will cause the next window to the side to always be visible.
        // Top and bottom struts will simply add outer gaps in addition to the area occupied by
        // layer-shell panels and regular gaps.
        struts {
            // left 64
            // right 64
            // top 10
            // bottom 64
        }
    }

    spawn-sh-at-startup "mako"
    spawn-sh-at-startup "swww-daemon"
    spawn-sh-at-startup "sleep 3 && swww img $HOME/Pictures/walls/basement.jpg"
    spawn-sh-at-startup "swaybg -m fill -i $HOME/Pictures/walls/disco.png"
    spawn-sh-at-startup "swayidle -w timeout 600 'niri msg action power-off-monitors' timeout 300 'swaylock' before-sleep 'swaylock'"
    spawn-sh-at-startup "wl-paste --watch cliphist store"
    spawn-sh-at-startup "/usr/lib/policykit-1-pantheon/io.elementary.desktop.agent-polkit"
    spawn-sh-at-startup "jamesdsp --tray"

    // EDITOR=nano sudo visudo -f /etc/sudoers.d/bluetooth-restart
    // add this line: sunny ALL=(ALL) NOPASSWD: /usr/bin/systemctl restart bluetooth
    spawn-sh-at-startup "systemctl --user stop pipewire wireplumber pipewire-pulse && sleep 1 && sudo systemctl restart bluetooth && sleep 1 && systemctl --user start pipewire wireplumber pipewire-pulse"

    prefer-no-csd

    environment {
        XCURSOR_THEME "catppuccin-mocha-dark-cursors"
        XCURSOR_SIZE "24"
        ELECTRON_OZONE_PLATFORM_HINT "auto"
        QT_QPA_PLATFORM "wayland"
        QT_QPA_PLATFORMTHEME "qt5ct"
        QT_QPA_PLATFORMTHEME_QT6 "qt6ct"
        QT_WAYLAND_DISABLE_WINDOWDECORATION "1"
        QT_AUTO_SCREEN_SCALE_FACTOR "1"
        QT_STYLE_OVERRIDE "kvantum"
        _JAVA_AWT_WM_NONREPARENTING "1"
        GDK_BACKEND "wayland,x11,*"
        SDL_VIDEODRIVER "wayland"
        CLUTTER_BACKEND "wayland,x11,*"
    }

    cursor {
        xcursor-theme "catppuccin-mocha-dark-cursors"
        xcursor-size 24
    }

    screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"

    // You can also set this to null to disable saving screenshots to disk.
    // screenshot-path null

    // Animation settings.
    // The wiki explains how to configure individual animations:
    // https://github.com/YaLTeR/niri/wiki/Configuration:-Animations
    animations {
        // Uncomment to turn off all animations.
        // off

        // Slow down all animations by this factor. Values below 1 speed them up instead.
        // slowdown 3.0
    }

    // Open the Firefox picture-in-picture player as floating by default.
    window-rule {
        match app-id=r#"firefox$"# title="^Picture-in-Picture$"
        open-floating true
    }

    // Example: block out two password managers from screen capture.
    // (This example rule is commented out with a "/-" in front.)
    /-window-rule {
        match app-id=r#"^org\.keepassxc\.KeePassXC$"#
        match app-id=r#"^org\.gnome\.World\.Secrets$"#

        block-out-from "screen-capture"

        // Use this instead if you want them visible on third-party screenshot tools.
        // block-out-from "screencast"
    }

    window-rule {
        geometry-corner-radius 4
        clip-to-geometry true
    }

    window-rule {
        match is-active=true
        opacity 0.95
    }

    window-rule {
        match is-active=false
        opacity 0.8
    }

    binds {
        Mod+Shift+Slash { show-hotkey-overlay; }

        Mod+T hotkey-overlay-title="Open a Terminal: ghostty" { spawn-sh "ghostty"; }

        Mod+A hotkey-overlay-title="Run an Application: fuzzel" { spawn-sh "fuzzel"; }

        Mod+Shift+Space hotkey-overlay-title="Kill waybar" { spawn-sh "pkill waybar"; }
        Mod+Space hotkey-overlay-title="Load waybar" { spawn-sh "waybar"; }

        Mod+X hotkey-overlay-title="Clipboard history" { spawn-sh "cliphist-fuzzel-img"; }

        Super+Alt+L hotkey-overlay-title="Lock the Screen: swaylock" { spawn-sh "swaylock"; }

        Mod+B hotkey-overlay-title="Restart bluetooth" { spawn-sh "systemctl --user stop pipewire wireplumber pipewire-pulse && sleep 1 && sudo systemctl restart bluetooth && sleep 1 && systemctl --user start pipewire wireplumber pipewire-pulse"; }

        Mod+Escape hotkey-overlay-title="Logout menu" { spawn-sh "logout-menu"; }

        Mod+P hotkey-overlay-title="Pick a color from screen" { spawn-sh r#"niri msg pick-color | awk '$1 == "Hex:" { printf "%s", $2 }' | wl-copy"#; }

        Mod+D hotkey-overlay-title="Toggle waybar visibility" {spawn-sh "pkill -SIGUSR1 waybar"; }

        XF86AudioRaiseVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"; }

        XF86AudioLowerVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"; }

        XF86AudioMute        allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; }

        XF86AudioMicMute     allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"; }

        XF86MonBrightnessUp  allow-when-locked=true { spawn-sh "brightnessctl set 5%+"; }

        XF86MonBrightnessDown allow-when-locked=true { spawn-sh "brightnessctl set 5%-"; }

        Mod+O repeat=false { toggle-overview; }

        Mod+Q { close-window; }

        Mod+Left  { focus-column-left; }
        Mod+Down  { focus-window-down; }
        Mod+Up    { focus-window-up; }
        Mod+Right { focus-column-right; }
        Mod+H     { focus-column-left; }
        Mod+J     { focus-window-down; }
        Mod+K     { focus-window-up; }
        Mod+L     { focus-column-right; }

        Mod+Ctrl+Left  { move-column-left; }
        Mod+Ctrl+Down  { move-window-down; }
        Mod+Ctrl+Up    { move-window-up; }
        Mod+Ctrl+Right { move-column-right; }
        Mod+Ctrl+J     { move-column-left; }
        Mod+Ctrl+K     { move-window-down; }
        Mod+Ctrl+I     { move-window-up; }
        Mod+Ctrl+L     { move-column-right; }

        Mod+Home { focus-column-first; }
        Mod+End  { focus-column-last; }
        Mod+Ctrl+Home { move-column-to-first; }
        Mod+Ctrl+End  { move-column-to-last; }

        Mod+Shift+Left  { focus-monitor-left; }
        Mod+Shift+Down  { focus-monitor-down; }
        Mod+Shift+Up    { focus-monitor-up; }
        Mod+Shift+Right { focus-monitor-right; }
        Mod+Shift+J     { focus-monitor-left; }
        Mod+Shift+K     { focus-monitor-down; }
        Mod+Shift+I     { focus-monitor-up; }
        Mod+Shift+L     { focus-monitor-right; }

        Mod+Shift+Ctrl+Left  { move-column-to-monitor-left; }
        Mod+Shift+Ctrl+Down  { move-column-to-monitor-down; }
        Mod+Shift+Ctrl+Up    { move-column-to-monitor-up; }
        Mod+Shift+Ctrl+Right { move-column-to-monitor-right; }
        Mod+Shift+Ctrl+J     { move-column-to-monitor-left; }
        Mod+Shift+Ctrl+K     { move-column-to-monitor-down; }
        Mod+Shift+Ctrl+I     { move-column-to-monitor-up; }
        Mod+Shift+Ctrl+L     { move-column-to-monitor-right; }

        Mod+Page_Down      { focus-workspace-down; }
        Mod+Page_Up        { focus-workspace-up; }
        Mod+U              { focus-workspace-down; }
        Mod+I              { focus-workspace-up; }
        Mod+Ctrl+Page_Down { move-column-to-workspace-down; }
        Mod+Ctrl+Page_Up   { move-column-to-workspace-up; }
        Mod+Ctrl+T         { move-column-to-workspace-down; }
        Mod+Ctrl+G         { move-column-to-workspace-up; }

        Mod+Shift+Page_Down { move-workspace-down; }
        Mod+Shift+Page_Up   { move-workspace-up; }
        Mod+Shift+T         { move-workspace-down; }
        Mod+Shift+G         { move-workspace-up; }

        Mod+WheelScrollDown      cooldown-ms=150 { focus-workspace-down; }
        Mod+WheelScrollUp        cooldown-ms=150 { focus-workspace-up; }
        Mod+Ctrl+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
        Mod+Ctrl+WheelScrollUp   cooldown-ms=150 { move-column-to-workspace-up; }

        Mod+WheelScrollRight      { focus-column-right; }
        Mod+WheelScrollLeft       { focus-column-left; }
        Mod+Ctrl+WheelScrollRight { move-column-right; }
        Mod+Ctrl+WheelScrollLeft  { move-column-left; }

        Mod+Shift+WheelScrollDown      { focus-column-right; }
        Mod+Shift+WheelScrollUp        { focus-column-left; }
        Mod+Ctrl+Shift+WheelScrollDown { move-column-right; }
        Mod+Ctrl+Shift+WheelScrollUp   { move-column-left; }

        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace 9; }
        Mod+Ctrl+1 { move-column-to-workspace 1; }
        Mod+Ctrl+2 { move-column-to-workspace 2; }
        Mod+Ctrl+3 { move-column-to-workspace 3; }
        Mod+Ctrl+4 { move-column-to-workspace 4; }
        Mod+Ctrl+5 { move-column-to-workspace 5; }
        Mod+Ctrl+6 { move-column-to-workspace 6; }
        Mod+Ctrl+7 { move-column-to-workspace 7; }
        Mod+Ctrl+8 { move-column-to-workspace 8; }
        Mod+Ctrl+9 { move-column-to-workspace 9; }

        Mod+BracketLeft  { consume-or-expel-window-left; }
        Mod+BracketRight { consume-or-expel-window-right; }

        Mod+Comma  { consume-window-into-column; }
        Mod+Period { expel-window-from-column; }

        Mod+R { switch-preset-column-width; }
        Mod+Shift+R { switch-preset-window-height; }
        Mod+Ctrl+R { reset-window-height; }
        Mod+F { maximize-column; }
        Mod+Shift+F { fullscreen-window; }

        Mod+Ctrl+F { expand-column-to-available-width; }

        Mod+C { center-column; }

        Mod+Ctrl+C { center-visible-columns; }

        Mod+Minus { set-column-width "-10%"; }
        Mod+Equal { set-column-width "+10%"; }

        Mod+Shift+Minus { set-window-height "-10%"; }
        Mod+Shift+Equal { set-window-height "+10%"; }

        Mod+V       { toggle-window-floating; }
        Mod+Shift+V { switch-focus-between-floating-and-tiling; }

        Mod+W { toggle-column-tabbed-display; }

        Print { screenshot; }
        Ctrl+Print { screenshot-screen; }
        Alt+Print { screenshot-window; }

        Ctrl+Escape allow-inhibiting=false { toggle-keyboard-shortcuts-inhibit; }

        Mod+Shift+E { quit; }
        Ctrl+Alt+Delete { quit; }

        Mod+Shift+P { power-off-monitors; }
    }

    // Disable the hot corners.
    gestures {
        hot-corners {
            off
        }
    }

    // Put swaybg inside the overview backdrop.
    layer-rule {
        match namespace="^wallpaper$"
        place-within-backdrop true
    }

    // Disable startup hotkey list
    hotkey-overlay {
        skip-at-startup
    }
    '';
  };
}
