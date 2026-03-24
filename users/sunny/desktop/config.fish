if status is-login
    set -gx CLUTTER_BACKEND wayland
    set -gx GDK_BACKEND wayland
    set -gx NIXOS_OZONE_WL 1
    set -gx QT_AUTO_SCREEN_SCALE_FACTOR 1
    set -gx QT_QPA_PLATFORM wayland
    set -gx QT_WAYLAND_DISABLE_WINDOWDECORATION 1
    set -gx SDL_VIDEODRIVER wayland
    set -gx _JAVA_AWT_WM_NONREPARENTING 1
    set -gx EDITOR nvim
    set -gx SUDO_EDITOR nvim
    set -gx VISUAL nvim
    set -gx GTK_THEME adw-gtk3
    set -gx QT_QPA_PLATFORMTHEME qt6ct
    set -gx TERMINAL alacritty
end
if status is-interactive
    abbr --add -- grep 'grep --color=auto'
    abbr --add -- l 'ls -alh'
    abbr --add -- ll 'ls -l'
    abbr --add -- ls 'ls --color=tty'
    abbr --add -- osc 'nh clean all'
    abbr --add -- oss 'nh os switch --ask . -H hpprobook'
    abbr --add -- ost 'nh os test --ask . -H hpprobook'
    abbr --add -- osb 'nh os build . -H hpprobook && nvd diff /run/current-system result && rm result'
    alias vi "nvim"
    alias vim "nvim"

    set -U fish_greeting
    set -g fish_key_bindings fish_vi_key_bindings
    set -gx SOPS_AGE_KEY_FILE /persist/var/lib/sops-nix/key.txt
end
