if status is-login
    set -Ux CLUTTER_BACKEND wayland
    set -Ux GDK_BACKEND wayland
    set -Ux NIXOS_OZONE_WL 1
    set -Ux QT_AUTO_SCREEN_SCALE_FACTOR 1
    set -Ux QT_QPA_PLATFORM wayland
    set -Ux QT_WAYLAND_DISABLE_WINDOWDECORATION 1
    set -Ux SDL_VIDEODRIVER wayland
    set -Ux _JAVA_AWT_WM_NONREPARENTING 1
    set -Ux EDITOR nvim
    set -Ux SUDO_EDITOR nvim
    set -Ux VISUAL nvim
    set -Ux GTK_THEME adw-gtk3
    set -Ux QT_QPA_PLATFORMTHEME qt6ct
end
if status is-interactive
    abbr --add -- grep 'grep --color=auto'
    abbr --add -- l 'ls -alh'
    abbr --add -- ll 'ls -l'
    abbr --add -- ls 'ls --color=tty'
    abbr --add -- osc 'nh clean all'
    abbr --add -- oss 'nh os switch --ask -f ./.'
    abbr --add -- ost 'nh os test --ask -f ./.'
    alias vi "nvim"
    alias vim "nvim"

    set -U fish_greeting
    set -g fish_key_bindings fish_vi_key_bindings
    set -Ux SOPS_AGE_KEY_FILE /persist/var/lib/sops-nix/key.txt
end
